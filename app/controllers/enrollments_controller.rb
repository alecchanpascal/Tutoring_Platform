class EnrollmentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy]
    before_action :is_tutor?, only: [:new, :create, :destory]
   
    def new
        @lessons = Lesson.all
        @enrollment = Enrollment.new
    end 
    
    def create
        @user = User.find(params[:enrollment][:student_id])
        @lesson = Lesson.find(params[:enrollment][:lesson_id])
        if @user.enrolled_courses.include?(@lesson)
            flash[:Error] = "Already enrolled in this course"
            redirect_back(fallback_location: root_path)
        else
            @enrollment = Enrollment.new
            @enrollment.student = @user
            @enrollment.lesson = @lesson
            if @enrollment.save
                flash[:Notice] = "Enrollment created Successfully!"
                redirect_to lesson_path(params[:enrollment][:lesson_id])
            else
                flash[:Error] = @enrollment.errors.full_messages.to_sentence
                render :new
            end
        end
    end

    def update
        @enrollment = Enrollment.find(params[:id])
        if @enrollment.update({is_accepted: true})
            flash[:Notice] = "Enrollment accepted!"
            redirect_back(fallback_location: root_path)
        else
            flash[:Error] = @enrollment.errors.full_messages.to_sentence
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @enrollment = Enrollment.find(params[:id])
        if @enrollment.destroy
            if current_user.is_tutor == true
                flash[:Notice] = "Enrollment denied!"
            else
                flash[:Notice] = "Enrollment cancelled!"
            end
            redirect_back(fallback_location: root_path)
        else
            flash[:Error] = @enrollment.errors.full_messages.to_sentence
            redirect_back(fallback_location: root_path)
        end
    end
end
