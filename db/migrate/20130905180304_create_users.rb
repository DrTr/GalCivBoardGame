class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :link
      t.string :image_link
      t.string :access

      t.timestamps
    end
  end
end
