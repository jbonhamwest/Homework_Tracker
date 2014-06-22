class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.datetime :assigned
      t.datetime :assigned_due
      t.timestamps
    end
  end
end
