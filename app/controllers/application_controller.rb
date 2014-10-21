class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, :if => :devise_controller?
  protect_from_forgery 
  # with: :exception

  def after_sign_in_path_for(resource)
    begin
      if Rails.env.development?
				response = Geocoder.search('99.231.218.69').first
      else
				response = Geocoder.search(request.remote_ip).first
      end
      unless response.blank?
				current_user.profile.update_attributes(:latitude => response.latitude, :longitude => response.longitude)
      end
      blog_path(current_user.blog)
    rescue
      blog_path(current_user.blog)
    end
  end

  protected

  #sign up params
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :first_name , :last_name)}
  end  
end
