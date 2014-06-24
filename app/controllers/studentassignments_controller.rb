class StudentassignmentsController < ApplicationController
  def index
    @studentassignments = Studentassignments.none
    if session[:student_id]
      @studentassignments = Studentassignments.where(student_id: session[:student_id])
    end
    flash[:notice] = nil
    flash[:color] = "none"
    @studentassignments.each do |assignment|
      if overdue(assignment.assignment.date_due, assignment.status)
        flash[:notice] = "Assignments highlighted in orange are overdue."
        flash[:color] = "invalid"
        break
      end
    end
  end

  def new
  end

  def show
  end

  def edit
  end

  def delete
  end

  private

  def overdue(date, status)
    true if (DateTime.now > date) && (status.eql? "assigned")
  end
end
