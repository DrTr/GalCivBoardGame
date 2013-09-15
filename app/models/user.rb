class User < ActiveRecord::Base
  PROVIDERS_LIST = %w(facebook google-oauth2 vkontakte github)
  ACCESS_LIST = %w(user moderator administrator baned deleted)
  URL_REGEXP = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/  
  AVATAR_REGEXP = /\Ahttps?.*(jpeg|jpg|gif|png)\z/
  before_create { self.access = "user" }
  validates :uid, presence: true
  validates :name, presence: true, length: { maximum: 32}
  validates :provider, inclusion: { in: PROVIDERS_LIST}
  validates :access, inclusion: { in: ACCESS_LIST }, on: :save
  validates :link, allow_blank: true, format: { with: URL_REGEXP }
  validates :image_link, allow_blank: true, format: { with: AVATAR_REGEXP }
  has_many :comments, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
end
