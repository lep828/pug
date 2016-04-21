class Group < ActiveRecord::Base
  has_many :subscribers
  has_many :users, through: :subscribers
end
