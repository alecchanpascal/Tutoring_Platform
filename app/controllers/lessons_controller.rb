class LessonsController < ApplicationController

    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = Lesson.new(lesson_params)
    end

    def index
        @lessons = Lesson.order(created_at: :desc)
    end

    def edit
        
    end

    def update
        
    end

    def destroy

    end

    private

    def lesson_params
        params.require(:lesson).permit(:subject, :description, :cost, :time_of_lesson, :tutor)
    end
end
