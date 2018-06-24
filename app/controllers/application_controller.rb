class ApplicationController < ActionController::Base
  before_action :get_requests, if: -> { current_user }

  private
    def get_requests
      @requests = current_user.requests_received
    end
end
