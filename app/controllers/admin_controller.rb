class AdminController < ApplicationController

  def index
    @lessons = Lesson.all
    @lesson = Lesson.find_by_id(params[:tutor_id])
    # @lesson.tutor_id(current_user.id)
#     @students = Enrollment.student_id
  end

  def edit

  end

  def update

  end

#   def show
#     @lesson = Lesson.tutor_id(current_user.id)
#     @students = Enrollment.student_id
#   end
end
