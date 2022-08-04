class EnrollmentsController < ApplicationController
    # before_action :find_enrollment, only: [:destroy]
    before_action :authenticate_user!, only: [:new, :create, :destroy]
    before_action :is_tutor?, only: [:new, :create, :destory]
   
    def new
        p "------  New Enrollment"
        @lessons = Lesson.all
        @enrollment = Enrollment.new
    end 
    
    def create
        @enrollment = Enrollment.new
        p "------  Create Enrollment"
        if is_duplicated?(current_user.id, params[:enrollment][:lesson_id].to_i)
            p "------  Create Enrollment"
            @enrollment.student_id = params[:enrollment][:lesson_id].to_i
            @enrollment.lesson_id = current_user.id
        
            p params, @enrollment, params[:enrollment][:lesson_id].to_i
            if @enrollment.save
                flash[:notice] = "Entrollment created Successfully!"
                p @enrollment
                redirect_to root_path
            else
                render :new
            end
        else
            flash[:danger] = "You have registered that course!"
            redirect_to root_path
        end
    end

    def destroy
        # p "-------  Enrollment---"
        # @enrollment.destroy
        # @lesson = Lesson.find @enrollment.lesson_id
        # flash[:alert] = @enrollment.errors.full_messages
        # redirect_to lessons_path, notice: "Your have cancelled your enrollment"       
    end

    private
    # def find_enrollment
    #     @enrollment = Enrollment.find_by(student_id: current_user.id, lesson_id: params[:enrollment][lesson_id].to_i)
    # end

    def is_duplicated?(student_id, lesson_id)
        Enrollment.find_by(student_id: student_id, lesson_id: lesson_id).present?
    end
end
