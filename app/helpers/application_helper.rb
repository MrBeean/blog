module ApplicationHelper
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('anonim.jpg')
    end
  end

  def post_img(post)
    if post.mainimg?
      post.mainimg.url
    else
      asset_path('post.jpg')
    end
  end
end
