class TutorsAdminController < ApplicationController

  def new

  end

  def create
    
  end

  def index
    @lessons = Lesson.tutor_id(current_user.id)
    @students = Enrollment.student_id
  end

  def edit

  end

  def update

  end



end
