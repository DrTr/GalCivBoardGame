class AddUserReferenceToFeedbacks < ActiveRecord::Migration
  def change
    add_reference :feedbacks, :user
  end
end
