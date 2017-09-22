class Post < ActiveRecord::Base
  belongs_to :user

  before_save do
    prepeare_post(self.post)
    prepeare_vimeo(self.post)
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

  def prepeare_vimeo(post)
    unless post.scan(/\bvimeovideo:(\d+)/).empty?
      video = post.match(/\bvimeovideo:(\d+)/).captures.first
      post.gsub!(/\bvimeovideo:\d+/, '<div class="embed-responsive embed-responsive-16by9">
               <iframe class="embed-responsive-item" src="//player.vimeo.com/video/' + video + '"></iframe>
               </div>')
    end
  end
end
