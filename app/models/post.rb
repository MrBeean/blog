class Post < ActiveRecord::Base
  belongs_to :user

  before_save do
    prepeare_post(self.post)
  end

  validates :title, presence: true, length: {maximum: 255}
  validates :post, presence: true
  validates :user, presence: true

  def post_preview(size)
    self.post.truncate(size)
  end

  mount_uploader :mainimg, MainimgUploader

  private

  def prepeare_post(post)
    post.gsub!(/<img alt=""/, '<img class="img-responsive" alt=""')
  end
end
