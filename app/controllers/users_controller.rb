class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @comment = Comment.new
    @post = Post.new
    @posts = @user.posts.order('created_at DESC')
  end

  def index
    @users = User.where('name ILIKE :search', 
                         search: "%#{params[:search][:name]}%")
  end

  def update
    @user = current_user    
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_back(fallback_location: root_path) 
    end
  end

  private

    def user_params
      params.require(:user).permit(:profile)
    end
end
