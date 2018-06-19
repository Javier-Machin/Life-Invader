class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(:created_at)
  end

  def index
    @users = User.where("name ?", "params[:search][:name]")
  end

end
