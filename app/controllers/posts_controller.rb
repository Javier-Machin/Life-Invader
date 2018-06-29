class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @comment = Comment.new
    posts = []
    if current_user.friends.count > 0
      current_user.friends.each do |friend|
        posts << friend.posts.all.ids
      end
    end
    posts << current_user.posts.all.ids if current_user.posts.count > 0
    @posts = Post.order('created_at DESC').find(posts) if posts.count > 0
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
