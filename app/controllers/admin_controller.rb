class AdminController < ApplicationController
  before_action :find_tutor_id, only: [:index]
  def index

    @lessons = Lesson.all.order(created_at: :desc)
    # @lesson = Lesson.find_by_id(params[:tutor_id])
    
    # @lesson.tutor_id(current_user.id)     
#     @students = Enrollment.student_id
  end

  def edit

  end

  def update

  end

  def destroy
    p "INSIDE ADMIN DESTROY"
    @lesson = Lesson.find params[:id]
    if @lesson.present?
      @lesson.destroy
      redirect_to lessons_path
    else
      render '/admin/index', status: 303 
      # 303 See Other redirect status response code indicates that the redirects don't link to the requested resource itself, but to another page (such as a confirmation page, a representation of a real-world object
    end
  end

#   def show
#     @lesson = Lesson.tutor_id(current_user.id)     
#     @students = Enrollment.student_id
#   end
  private

  def find_tutor_id
    @lesson = Lesson.find_by_id(params[:tutor_id])
  end
end
