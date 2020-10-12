class ApplicationController < ActionController::Base
    
    helper_method :current_user
    
    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login_user!(user)
        @current_user = user
        session[:session_token] = user.reset_session_token!
    end

    def already_signed_in
        redirect_to cats_url unless current_user.nil?
    end

    def not_signed_in
        redirect_to _url unless current_user.nil?
    end

end