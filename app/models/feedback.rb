class Feedback < ActiveRecord::Base
  belongs_to :user

  validates :email, email: true
  validates :email, presence: true
  validates :message, presence: true
  validates :name, presence: true

  validates :name, length: { maximum: 40 }
  validates :name, format: { with: /\A[\w]*\z/, message: 'Только английские буквы и цифры & _' }
end
