class AddStudentAssociations < ActiveRecord::Migration
  def change
    add_column :students, :user_id, :integer
    add_column :assignments, :student_id, :integer
    add_column :teachers, :student_id, :integer
  end
end
