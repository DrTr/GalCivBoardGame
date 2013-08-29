class Admin < ActiveRecord::Base
  EMAIL_REGEXP = /\A([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})\z/  
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true 
  before_save :create_remember_token
  validates :email, presence: true, uniqueness: { case_sensivite: false },
    format: { with: EMAIL_REGEXP }
  has_secure_password
  before_save :create_remember_token
  
  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
