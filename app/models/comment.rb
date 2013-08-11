class Comment < ActiveRecord::Base
  validates :author, presence: true, length: {maximum: 25}
  validates :content, presence: true
  validates :message_id, presence: true
  default_scope -> { order('created_at DESC') }
  belongs_to :message
end
