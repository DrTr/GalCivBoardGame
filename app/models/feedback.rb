class Feedback < ActiveRecord::Base
  EMAIL_REGEXP = /\A([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})\z/  
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  validates :mark, allow_blank: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :email, allow_blank: true, format: { with: EMAIL_REGEXP }
  validates :user_id, presence: true
end
