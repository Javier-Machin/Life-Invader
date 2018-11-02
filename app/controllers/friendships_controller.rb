class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.friendships.create(receiver: User.find(params[:id]))
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @friendship = Friendship.find_by(sender: current_user, 
                                     receiver: User.find(params[:id]))
    @friendship.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
