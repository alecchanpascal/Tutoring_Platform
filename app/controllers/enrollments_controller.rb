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
        @lessons = Lesson.all
        @enrollment = Enrollment.new
        p "------  Create Enrollment1", "lecture_id",  params.require(:enrollment).permit(:lesson_id, :student_id)
        # enrollment1 = Enrollment.find_by( student_id: current_user.id)
        enrollments = Enrollment.all
        p "------ LOOPING---"
        # is_duplicate = false
        # for enrollment in enrollments do
           
        #     if enrollment.lesson_id == params[:enrollment][:lesson_id].to_i
        #         # p enrollment.lesson_id
        #         # p "student id ". enrollment.user.student_id.to_i
        #         # p "student id ". enrollment.student.student_id.to_i
        #         p "student id ", enrollment.student_id #this shows up
        #         # p "user id ". current_user.id.to_i
        #         #is_false = enrollment.student_id == current_user.id
        #     end
        #     end
        # end

        p "------ LOOPING ENDS HERE---"
        # enrollment2 = Enrollment.find_by( lesson_id: params[:enrollment][:lesson_id].to_i)
        # enrollment3 = Enrollment.find_by( student_id: current_user.id)
        # enrollment4 = Enrollment.find_by_lesson_id( student_id: current_user.id)
        # enrollment5 = Enrollment.find_by_id( lesson_id: params[:enrollment][:lesson_id].to_i)
        
        # p "----------ENROLLMENT FROM DB: ", enrollment3
        # p "current_user.id", current_user.id #this shows up
        # if is_duplicate == false
            p "------  Create Enrollment2"
            @enrollment.student_id = session[:user_id]
            @enrollment.lesson_id = params[:enrollment][:lesson_id].to_i
            p "------  11111-----------"
            p params, @enrollment, params[:enrollment][:lesson_id].to_i
            p "------ 222222 -----------"
            if @enrollment.save!
                @enrollment.is_registered = true
                @enrollment.save!
                flash[:notice] = "Enrollment created Successfully!"
                p @enrollment
                redirect_to root_path
            else
                flash[:error] = @enrollment.errors.full_messages.to_sentence
                render :new
            end
        # else
        #     flash[:danger] = "You didn't register!"
        #     redirect_to root_path
        # end
    # end
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

    # def is_duplicated?(student_id, lesson_id)
    #     Enrollment.find_by(student_id: student_id, lesson_id: lesson_id).present?
    # end
end
