class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: {maximum: 255}
  validates :post, presence: true
  validates :user, presence: true

  def post_preview(size)
    self.post.truncate(size)
  end

  mount_uploader :mainimg, MainimgUploader
end
