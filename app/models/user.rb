class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :user_image, UserImageUploader

  has_many :subscribers
  has_many :groups, through: :subscribers

  validates :username, uniqueness: true, presence: true
  validates :username, length: { in: 4..20 }
  validates :description, presence: true

  def subscribers_without_game(game)
    subscribers.where(admin: true).select do |subscriber|
      subscriber if subscriber.group && !subscriber.group.has_game?(game)
    end
  end

  def subscribers_without_game?(game) 
    subscribers_without_game(game).length > 0
  end

end

