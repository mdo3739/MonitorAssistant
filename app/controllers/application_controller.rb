class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: "Can't go there!"
  end

  def after_sign_in_path_for(resource)
    applications_path
  end
end
