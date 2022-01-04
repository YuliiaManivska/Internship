class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  load_and_authorize_resource
  
  rescue_from CanCan::AccessDenied do |_exception|
    flash[:alert] = "Access denied."
    redirect_to root_url
  end
end
