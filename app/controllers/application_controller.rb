class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  around_filter :set_time_zone
  
  private
  
  # http://ilikestuffblog.com/2011/02/03/how-to-set-a-time-zone-for-each-request-in-rails/
  def set_time_zone
    old_time_zone = Time.zone
    Time.zone = current_user.time_zone if user_signed_in?
    yield
  ensure
    Time.zone = old_time_zone
  end
  
  def subdomain
    @subdomain = request.subdomain
  end

  def current_account
    @current_account ||= Account.for_subdomain(subdomain).first
  end

  # This will redirect the user to your 404 page if the account can not be found
  # based on the subdomain. You can change this to whatever best fits your
  # application.
  def validate_subdomain
    if current_account || request.host == "localhost"
    elsif current_account.nil?
      redirect_to '/404.html'
    end
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
  
end
