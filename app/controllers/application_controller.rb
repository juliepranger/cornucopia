class String
    def is_i?
       !!(self =~ /^[-+]?[0-9]+$/)
    end

    def is_f?
       !!(self =~ /^[-+]?[0-9.]+$/)
    end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id]) #caching the current_user for future use, "memo-ization"
    end
  end

  def authenticate_user
    redirect_to authentications_url unless current_user
  end

end
