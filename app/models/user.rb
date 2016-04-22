class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :subscribers
  has_many :groups, through: :subscribers

  validates :username, uniqueness: true, presence: true
  validates :username, length: { in: 4..20 }
  validates :description, presence: true
end

