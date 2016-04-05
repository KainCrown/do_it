module ChatHelper
  def render_user_email(message)
    User.find_by_id(message.user_id).try(:email) || "Anonymous"
  end
end
