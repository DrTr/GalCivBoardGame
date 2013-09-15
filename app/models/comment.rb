class Comment < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 255 }
  validates :message_id, presence: true
  validates :user_id, presence: true
  default_scope -> { order('created_at DESC') }
  belongs_to :message
  belongs_to :user
  include SmartLinks
end
