require 'redcarpet/compat'
class StudentassignmentsController < ApplicationController
  before_action :set_studentassignment, only: [:show, :edit, :update, :delete]

  def index
    @studentassignments = Studentassignment.none
    if session[:student_id]
      @studentassignments = Studentassignment.where(student_id: session[:student_id])
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

  def update
    respond_to do |format|
      if @studentassignment.update(studentassignment_params)
        format.html { redirect_to controller: "studentassignments",
                      action: "index", notice: 'Assignment was successfully submitted.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_studentassignment
    @studentassignment = Studentassignment.find(params[:id])
  end

  def studentassignment_params
    params.require(:studentassignment).permit(:id, :status, :work)
  end

  def overdue(date, status)
    true if (DateTime.now > date) && (status.eql? "assigned")
  end
end
