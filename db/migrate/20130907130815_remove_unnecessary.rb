class RemoveUnnecessary < ActiveRecord::Migration
  def change
    remove_column :comments, :author
    remove_column :feedbacks, :name
    drop_table :admins
  end
end
