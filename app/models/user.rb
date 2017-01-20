class User < ActiveRecord::Base
  has_secure_password
  has_many :teas
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
end
