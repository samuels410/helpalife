module OrganizationsHelper

  def show_phone_no(user)
    user.phone_no_visibility ? user.phone_no : 'private'
  end

  def show_username(user)
    truncate(user.name,length: 25, omission: '..')
  end
  
  def show_profile_pic(user)
    return  image_tag(user.avatar.url(:thumb), class: "img img-circle  img-responsive media-object",
      size: "60") if user.avatar_url.blank?
    image_tag(user.avatar_url, class: "img img-circle  img-responsive media-object", size: "60")
  end

end
