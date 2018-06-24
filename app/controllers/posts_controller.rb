class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    posts = []
    if current_user.friends.count > 0
      current_user.friends.each do |friend|
        posts << friend.posts.all.ids
      end
    end
    posts << current_user.posts.all.ids if current_user.posts.count > 0
    @posts = Post.order(:created_at).find(posts) if posts.count > 0
  end
  
end
