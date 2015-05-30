module Blog::PostHelper

  def is_journalist?
    current_user.has_role?(:journalist)
  end

  def logged?
    current_user
  end
end
