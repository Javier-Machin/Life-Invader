class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    if    params[:type] == "post"
      @like = current_user.likes.new(likeable: Post.find(like_params[:likeable]))
    elsif params[:type] == "comment"
      @like = current_user.likes.new(likeable: Comment.find(like_params[:likeable]))
    end
    @like.save
    redirect_back(fallback_location: root_path) 
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy if @like.author == current_user 
    redirect_back(fallback_location: root_path)
  end

  private

    def like_params
      params.require(:like).permit(:likeable)
    end
end
