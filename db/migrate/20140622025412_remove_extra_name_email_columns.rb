class RemoveExtraNameEmailColumns < ActiveRecord::Migration
  def change
    remove_column :students, :name, :string
    remove_column :students, :email, :string
    remove_column :students, :teacher, :string
    remove_column :teachers, :name, :string
    remove_column :teachers, :email, :string
    remove_column :teachers, :student_id, :integer
    remove_column :assignments, :student_id, :integer
  end
end
