# module Dashboard
class Dashboard::AdminController < ApplicationController
  before_action :find_lessons, only: [:index, :edit, :update]
  
  def index
    @lessons = Lesson.all.order(time_of_lesson: :asc)
    @reviews = Review.all.order(created_at: :asc)
  end

  def edit
    render :edit
  end

  def update
      p params
      if @lesson.update params.require(:lesson).permit(:subject, :description, :cost, :time_of_lesson)
          #redirect_to ?????????????
          p worked!
      else
          render :edit
      end
  end

  def destroy
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

  def find_lessons
    @lesson = Lesson.find_by_id(params[:tutor_id])
  end
end
# end