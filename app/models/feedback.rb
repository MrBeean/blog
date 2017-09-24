class Feedback < ActiveRecord::Base
  belongs_to :user

  validates :email, email: true
  validates :email, presence: true
  validates :message, presence: true

  validates :name, length: { maximum: 40 }
  validates :name, format: { with: /\A[\w]*\z/, message: 'Тлько английские буквы и цифры & _' }
end
