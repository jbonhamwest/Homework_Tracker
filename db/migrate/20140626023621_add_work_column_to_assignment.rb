class AddWorkColumnToAssignment < ActiveRecord::Migration
  def change
    add_column :studentassignments, :work, :text
  end
end
