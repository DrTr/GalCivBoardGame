class AddUrlTitleToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :url_title, :string
  end
end
