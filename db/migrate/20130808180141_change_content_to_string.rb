class ChangeContentToString < ActiveRecord::Migration
  def change
    change_column :messages, :content, :text
  end
end
