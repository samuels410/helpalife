module OrganizationsHelper

  def show_phone_no(user)
    user.phone_no_visibility ? user.phone_no : 'private'
  end

  def show_username(user)
    truncate(user.name,length: 25, omission: '..')
  end
  
  def show_profile_pic(user)
    avatar_url = user.avatar_url.present? ? user.avatar_url : user.avatar.url(:thumb)
    return image_tag(avatar_url, size: '60',class: "img img-circle img-responsive media-object")
  end

  # This helper method will prepare dynamic headlines(show/my_organization)
  def organization_headline
    show_headline = 'Organizations'
    my_headline = "My Organizations"
    is_index?  ? show_headline : my_headline
  end

  def is_index?
    params[:action] == 'index'
  end

  def is_my_organizations?
    params[:action] == 'my organizaiton'
  end   

end
