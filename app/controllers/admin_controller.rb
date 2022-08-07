class AdminController < ApplicationController

  def index
    @lessons = Lesson.all
    @lesson = Lesson.find_by_id(params[:tutor_id])
  end

  def edit
  end

  def update
  end

end
