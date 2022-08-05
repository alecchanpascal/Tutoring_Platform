class LessonsController < ApplicationController
    before_action :find_lesson_id

    def new
        @lesson = Lesson.new
    end

    def show
    end

    def create
        @lesson = Lesson.new(lesson_params)
        @lesson.user = current_user
        if @lesson.save
            flash[:notice]= "Lesson created successfully!"
            redirect_to lesson_path(@lesson)
        else
            render :new
        end
    end

    def index
        @lessons = Lesson.order(created_at: :desc)
    end

    def edit
        
    end

    def update
        if @lesson.update(lesson_params)
            redirect_to lesson_path(@lesson)
        else
            render :edit
        end
    end

    def destroy
        if @lesson.present?
            @lesson.destroy
            redirect_to lessons_path
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
