class TutorAdminController < ApplicationController

  def index
    @lessons = Lessons.order(created_at: :desc)
  end

  def edit

  end

  def update

  end



end
