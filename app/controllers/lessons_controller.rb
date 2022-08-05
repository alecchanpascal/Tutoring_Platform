class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_student?, only: [:new, :create]
 
    def new
        @lesson = Lesson.new
    end

    def show
        @lesson = Lesson.find(params[:id])
    end

    def create

        @lesson = Lesson.new params.require(:lesson).permit(:subject, :description, :cost, :time_of_lesson)
        p "create lesson"
        if current_user.is_tutor
            @lesson.tutor_id = current_user.id
            p "ERRORRRR" , @lesson.errors.messages
            if @lesson.save
                flash[:notice]= "Lesson created successfully!"
                redirect_to lessons_path
            else
                flash[:notice]= "Did not work!"
                render :new
            end
        else
            redirect_to root_path, notice: "tutors only"
        end 


    end

    def index
        @lessons = Lesson.order(created_at: :desc)
    end
    def show
        p "Lesson show"
        @lesson = Lesson.find_by_id(params[:id])
        @student_array = []
        @lesson.enrollments.each do |enrollment|
            student = User.find_by(id: enrollment.student_id)
            if student.is_tutor != true
                @student_array.push(student)
            end

        end

    end

    def edit

        @lesson = Lesson.find_by_id(params[:id])
    end

    def update
        @lesson = Lesson.find_by_id(params[:id])
        if @lesson.update(params.require(:lesson).permit(:subject, :description, :cost, :time_of_lesson))
            redirect_to lesson_path(@lesson)
        else
            render :edit
        end    
    end


    def destroy
        @lesson = Lesson.find_by_id(params[:id])
        if @lesson.present?
            array_of_enrollments_related_to_lesson = Enrollment.find_lesson_id(@lesson.id)
            array_of_enrollments_related_to_lesson.each do |enrollment|
                enrollment.destroy
            end
            @lesson.destroy
            redirect_to lessons_path
        else
            render :show
        end
    end
    
    private

    def find_lesson_id
        @lesson = Lesson.find(params[:id])
    end

    def lesson_params
        params.require(:lesson).permit(:subject, :description, :cost, :time_of_lesson, :tutor)
    end
end
