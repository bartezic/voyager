module ApplicationHelper
  def active_nav_class(link_path)
    current_page?(link_path) ?
      'bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium' :
      'text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium'
  end

  def current_user_root_path
    user_signed_in? ? cabinet_path : root_path
  end
end