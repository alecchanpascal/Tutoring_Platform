class UsersController < ApplicationController
  # =============CALLBACKS=====================


    def new
        @user = User.new
    end

    def create
      @user = User.new load_users
      if @user.save
        # if User_isTutor?
        #     redirect_to tutor_admin_dashboard_index_path(current_user.id), {notice: "Tutor Panel Logged In"}
        # else
          session[:user_id] = @user.id
          flash.notice = "Signed up!"
          redirect_to lessons_path
        
      else
        render :new, status: 303
      end

    end


    private

    def load_users
        params.require(:user).permit(
          :username,
          :email,
          :password,
          :password_confirmation,
          :is_tutor
        )
    end
end
