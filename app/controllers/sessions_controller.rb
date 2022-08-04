class SessionsController < ApplicationController
    def new
        p "BEEN HIT"
    end

    def create
        @user = User.find_by_email params[:email]
        if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to lessons_path, {notice: "Logged In"}
        else
        render :new, {alert: "Wrong email or password!", status: 303}
        end
    end

    def destroy
        session[:user_id] = nil
        flash.notice = "Logged out"
        redirect_to lessons_path
    end
end
