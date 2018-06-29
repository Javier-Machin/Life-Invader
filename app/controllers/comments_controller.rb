class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.comments.create(content: comment_params[:content],
                                 post:    Post.find(comment_params[:post]))
    redirect_back(fallback_location: root_path)                              
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if @comment.author == current_user 
    redirect_back(fallback_location: root_path)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :post)
    end
end
