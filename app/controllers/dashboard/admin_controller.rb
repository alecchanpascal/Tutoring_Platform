# module Dashboard
class Dashboard::AdminController < ApplicationController
  before_action :find_lessons, only: [:index, :edit, :update]
  
  def index
    @lessons = Lesson.all.order(time_of_lesson: :asc)
    @reviews = Review.all.order(created_at: :asc)
    @notes = Notification.all.order(created_at: :desc)
  end

  def edit
    render :edit
  end

  def update
      if @lesson.update params.require(:lesson).permit(:subject, :description, :cost, :time_of_lesson)
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
    end
  end

  private

  def find_lessons
    @lesson = Lesson.find_by_id(params[:tutor_id])
  end
end