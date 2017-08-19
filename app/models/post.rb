class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: {maximum: 255}
  validates :post, presence: true
  validates :visible, presence: true
  validates :user, presence: true

  def post_preview
    self.post.truncate(250)
  end
end
