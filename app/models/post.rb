class Post < ActiveRecord::Base
  validates :title, presence: true, lenght: { maximum: 255 }
  validates :text, presence: true
  validates :visible, presence: true
end
