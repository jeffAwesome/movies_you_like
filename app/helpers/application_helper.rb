module ApplicationHelper
  def body_class
    [controller_name, action_name].join('-')
  end

  def has_playlists?
    current_user.playlists
  end

end
