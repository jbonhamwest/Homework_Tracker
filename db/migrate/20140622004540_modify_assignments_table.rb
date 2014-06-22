class ModifyAssignmentsTable < ActiveRecord::Migration
  def change
    change_table :assignments do |t|
      t.rename :assigned, :date_assigned
      t.rename :assigned_due, :date_due
    end
  end
end
