class ApplicationController < ActionController::Base


    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
    helper_method :current_user

    def user_sign_in?
        current_user.present?
    end
    helper_method :user_sign_in?

    # if it is a tutor, you not allowed to register course
    def is_tutor?
        redirect_to root_path,  notice: "Tutor can not register a course" if current_user.is_tutor == true
    end

    def tutor_check?
        current_user.is_tutor
    end
    helper_method :tutor_check?
    # if it is a tutor, you not allowed to register course
    def is_student?
        redirect_to new_session_path,  notice: "A student can not register a course" if current_user.is_tutor == false
    end


    def authenticate_user!
        redirect_to new_session_path,  notice: "Please sign in" unless user_sign_in?
    end
    
    def User_isTutor?
      current_user.is_tutor
    end
    helper_method :User_isTutor?

end
