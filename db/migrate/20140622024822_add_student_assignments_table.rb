class AddStudentAssignmentsTable < ActiveRecord::Migration
  def change
    create_table :studentassignments do |t|
      t.integer :assignment_id
      t.integer :student_id
      t.string :status
    end
  end
end
