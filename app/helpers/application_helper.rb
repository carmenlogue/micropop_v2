module ApplicationHelper
  def active_link_class(link_name)
    'active' if params[:action] == link_name
  end
end
