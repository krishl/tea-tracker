class Tea < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
end
