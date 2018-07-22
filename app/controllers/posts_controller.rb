class PostsController < ApplicationController
  before_action -> { flash.keep(:notice) }, only: [:index]
  before_action :authenticate_user!

  def index
    @post = Post.new
    @comment = Comment.new
    posts = []
    friends = current_user.friends
    friends.each do |friend|
      posts += friend.posts.pluck(:id)
    end
    posts += current_user.posts.pluck(:id) 
    @posts = Post.where(id: posts).includes(:author, 
                                            comments:[:author, likes:[:author]], 
                                            likes:[:author]).order('created_at DESC') 
  end

  def create
    @post = Post.new(author:  current_user, 
                     content: post_params[:content], 
                     picture: post_params[:picture])
    @post.save
    redirect_back(fallback_location: root_path) 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy if @post.author == current_user 
    redirect_back(fallback_location: root_path)
  end

  private

    def post_params
      params.require(:post).permit(:content, :picture)
    end
end
