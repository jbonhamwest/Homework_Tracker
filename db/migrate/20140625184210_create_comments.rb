class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :studentassignment_id
      t.text :comment
      t.integer :teacher_id
      t.timestamps
    end
  end
end
