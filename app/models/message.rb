class Message < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 25}
  validates :content, presence: true
  PATH_REGEX = /\A[a-z0-9-]{2,25}\z/ 
  validates :url_title, presence: true, format: { with: PATH_REGEX },
                        uniqueness: true
  default_scope -> { order('created_at DESC') }
  has_many :comments, dependent: :destroy
  
  def to_param
    "#{url_title.parameterize}"
  end
end
