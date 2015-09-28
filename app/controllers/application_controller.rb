class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to  '/users/sign_in', :alert => exception.message
  end
  protect_from_forgery


end
