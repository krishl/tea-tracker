class User < ActiveRecord::Base
  has_secure_password   # validates BCrypt passwords
  has_many :teas
  validates :username, :email, uniqueness: true
  validates :username, :email, presence: true
end
