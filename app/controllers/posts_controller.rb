class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    posts = []
    current_user.friends.each do |friend|
      posts << friend.posts.all.ids
    end
    posts << current_user.posts.all.ids
    @posts = Post.order(:created_at).find(posts)
    @requests = current_user.requests_received
  end
  
end
