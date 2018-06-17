class PostsController < ApplicationController
  def index
    @posts = current_user.friends.posts.order(:created_at)
  end
end
