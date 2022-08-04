class ApplicationController < ActionController::Base
  
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
    helper_method :current_user

    def user_sign_in?
        current_user.present?
    end
    helper_method :user_sign_in?
    
    def authenticate_user!
        redirect_to new_session_path,  notice: "Please sign up" unless user_sign_in?
    end
end
