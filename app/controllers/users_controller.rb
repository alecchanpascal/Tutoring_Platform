class UsersController < ApplicationController
    def new
        @user = User.new
      end
    
      def create
        @user = User.new load_users
        if @user.save
          session[:user_id] = @user.id
          flash.notice = "Signed up!"
          redirect_to root_path
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
