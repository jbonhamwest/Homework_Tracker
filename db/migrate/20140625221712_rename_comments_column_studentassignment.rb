class RenameCommentsColumnStudentassignment < ActiveRecord::Migration
  def change
    rename_column :comments,  :studentassignment_id, :studentassignments_id
  end
end
