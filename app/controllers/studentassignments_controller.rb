class StudentassignmentsController < ApplicationController
  def index
    @studentassignments = Studentassignments.none
    if session[:student_id]
      @studentassignments = Studentassignments.where(student_id: session[:student_id])
    end
  end

  def new
  end

  def show
  end

  def edit
  end

  def destory
  end
end
