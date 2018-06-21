class FriendRequestsController < ApplicationController
  before_action :allowed_user?, only: [:destroy]

  def destroy
    FriendRequest.find(params[:id]).destroy 
    redirect_to root_path
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
