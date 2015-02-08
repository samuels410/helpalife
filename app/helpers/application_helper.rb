module ApplicationHelper

  def full_title(page_title)
    base_title = "Voluntary blood donors community"
    @page_title = page_title
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def show_title?
    @show_title =true
  end

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
			<div class="alert alert-error alert-block">
				<button type="button" class="close" data-dismiss="alert">&#215;</button>
				#{messages}
			</div>
    HTML
    html.html_safe
  end

  
=begin
  Description: Method will return the error messages on the key fields.
  Argument: error_object, key
  Return: message on error object.
=end
  def form_error(object, key)
    messages = object.errors.messages
    messages[key.to_sym][0] if messages[key.to_sym].present?
  end

  def camp_profile_url
    image_url = current_user.avatar_url
    avatar = image_url.present? ? image_url : current_user.avatar.url(:thumb)
    image_tag( avatar, class: 'img img-round', style: 'width: 30px;')
  end

end
