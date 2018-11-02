class ApplicationController < ActionController::Base
  before_action :get_requests, if: -> { current_user }
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    
    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthdate])
    end

  private
  
    def get_requests
      @requests = current_user.requests_received.includes(:sender)
    end
end
