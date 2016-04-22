class Group < ActiveRecord::Base
  has_many :subscribers
  has_many :users, through: :subscribers
  has_and_belongs_to_many :games


  validates :name, uniqueness: true, presence: true
  validates :name, length: { in: 5..30 }
  validates :description, presence: true
  validates :image, presence: true
end
