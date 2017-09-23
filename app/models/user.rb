class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :trackable,
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :feedbacks

  validates :name, presence: true, length: { maximum: 35 }
  validates :info, length: { maximum: 500 }

  mount_uploader :avatar, AvatarUploader
end
