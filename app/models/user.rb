class User < ActiveRecord::Base
  has_secure_password
  has_many :teas
  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :email

  def slug
    username.chomp.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find do |user|
      user.slug == slug
    end
  end
end
