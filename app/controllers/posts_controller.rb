class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    posts = []
    current_user.friends.each do |friend|
      posts << friend.posts.all.ids
    end
    posts << current_user.posts.all.ids
    unless posts.count > 0
      @posts = Post.order(:created_at).find(posts)
    end
    @requests = current_user.requests_received
  end
  
end
