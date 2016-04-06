module AvatarHelper
  def contact_avatar(element, options = {})
    if element.photo.nil?
      image_tag element.avatar_url, options
    else
      image_tag element.photo.thumb('150x150#').url, options
    end
  end
end
