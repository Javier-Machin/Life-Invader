class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @comment = Comment.new
    @post = Post.new
    @posts = @user.posts.includes(:author, 
                                  comments:[:author, likes:[:author]], 
                                  likes:[:author]).order('created_at DESC')
  end

  def index
    if params[:user_friend_list] 
      @users = User.find(params[:user_friend_list]).friends
    else
      @users = User.where('name ILIKE :search', 
                           search: "%#{params[:search][:name]}%")
    end
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
