class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.comments.create(post: Post.find(params[:comment][:post_id]),
                                 content: params[:comment][:content])
    redirect_back(fallback_location: root_path)                              
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if @comment.author == current_user 
    redirect_back(fallback_location: root_path)
  end
end
