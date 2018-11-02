class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    if    params[:type] == "post"
      @like = current_user.likes.new(likeable: Post.find(like_params[:likeable]))
    elsif params[:type] == "comment"
      @like = current_user.likes.new(likeable: Comment.find(like_params[:likeable]))
    end
    @like.save
    @post = @like.likeable.id
    @likes = @like.likeable.likes.size
    @type = @like.likeable_type.downcase
    respond_to do |format|
      format.js 
    end 
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.author == current_user
      @post = @like.likeable.id
      @type = @like.likeable_type.downcase
      @like.destroy 
      @likes = @like.likeable.likes.size
    end
    respond_to do |format|
      format.js
    end 
  end

  private

    def like_params
      params.require(:like).permit(:likeable)
    end
end