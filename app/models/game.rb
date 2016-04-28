class Game < ActiveRecord::Base
  has_and_belongs_to_many :groups

  acts_as_commentable

  validates :name, presence: true, uniqueness: true
  validates :name, length: { in: 4..40 }
  validates :image, presence: true
  validates :description, presence: true
end
