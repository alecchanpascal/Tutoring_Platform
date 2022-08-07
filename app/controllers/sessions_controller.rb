class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by_email params[:email]
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to lessons_path, {notice: "Logged In"}
        else
            flash[:alert] = "Wrong email or password!"
            render :new, status: 303
        end
    end

    def destroy
        session[:user_id] = nil
        flash.notice = "Logged out"
        redirect_to lessons_path
    end
end
