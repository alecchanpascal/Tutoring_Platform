class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :is_student?, only: [:new, :create]
 
    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = Lesson.new params.require(:lesson).permit(:subject, :description, :cost, :time_of_lesson)
        if current_user.is_tutor
            @lesson.tutor_id = current_user.id
            if @lesson.save
                flash[:Notice]= "Lesson created successfully!"
                redirect_to lessons_path
            else
                flash[:Error] = @lesson.errors.full_messages.to_sentence
                render :new, status: 303
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
        if params[:event_option].present?
            p params[:event_option]
        end
        @accepted_students_array = []
        @not_accepted_students_array = []
        @lesson.enrollments.each do |enrollment|
            student = User.find_by(id: enrollment.student_id)
            if student.is_tutor != true && enrollment.is_accepted 
                p "-----accepted students-----", student
                @accepted_students_array.push(student)
            elsif student.is_tutor != true && enrollment.is_accepted == false
                @not_accepted_students_array.push(student)
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
