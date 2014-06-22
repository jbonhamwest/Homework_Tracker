class AddTeacherAssociations < ActiveRecord::Migration
  def change
    add_column :teachers, :user_id, :integer
    add_column :assignments, :teacher_id, :integer
    add_column :students, :teacher_id, :integer
  end
end
