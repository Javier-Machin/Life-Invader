class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :allowed_user?, only: [:destroy]

  def destroy
    FriendRequest.find(params[:id]).destroy 
    redirect_back(fallback_location: root_path)
  end

  def create
    current_user.friend_requests.create(receiver: User.find(params[:id]))
    redirect_back(fallback_location: root_path)
  end 

  private 

    def allowed_user?
      receiver = FriendRequest.find(params[:id]).request_receiver
      if receiver != current_user.id
        flash[:error] = "Unauthorized request"
        redirect_to root_path
      end 
    end

end
