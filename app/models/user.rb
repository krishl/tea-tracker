class User < ActiveRecord::Base
  has_secure_password
  has_many :teas
  validates :username, :email, uniqueness: true
  validates :username, :email, presence: true
end
