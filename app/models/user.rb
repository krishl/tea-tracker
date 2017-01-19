class User < ActiveRecord::Base
  has_secure_password
  has_many :teas
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true

  def slug
    username.chomp.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find do |user|
      user.slug == slug
    end
  end
end
