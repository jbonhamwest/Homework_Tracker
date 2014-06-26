class RenameCommentsStudentAssignments < ActiveRecord::Migration
  def change
    rename_column :comments,  :studentassignments_id, :studentassignment_id
  end
end
