class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(:created_at)
  end

  def index
    @users = User.where('name ILIKE :search', 
                         search: "%#{params[:search][:name]}%")
  end

  def update
    @user = current_user    
    if @user.update(profile: params[:user][:profile])
      flash[:success] = "Profile updated"
      redirect_back(fallback_location: root_path) 
    end
  end

end
