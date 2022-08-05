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
        flash[:Error] = @user.errors.full_messages.to_sentence
        render :new, status: 303
      end

    end


    def edit
      # @lessons = Lesson.order(created_at: :desc)
    end

    def index
      @users = User.tutors
    end

    def show
      @user = User.find(params[:id])
      @lessons = @user.lessons.order(time_of_lesson: :asc)
      @reviews = @user.reviews_for.order(created_at: :desc)
      current_user.reviews_by.each do |review|
        if review.tutor == @user
          @review = review
          break
        end
      end
      if !@review
        @review = Review.new
      end
    end

      def edit
        # @lessons = Lesson.order(created_at: :desc)
      end

      def index

        # @lessons = Lesson.order(created_at: :desc)

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
