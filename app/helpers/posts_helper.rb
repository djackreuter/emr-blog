module PostsHelper
  def belongs_to_user?(post)
    current_user.id == post.user_id
  end

  def admin?(post)
    current_user.admin? && current_user.id != post.user_id
  end

  def image?(post)
    post.post_image.present?
  end
end
