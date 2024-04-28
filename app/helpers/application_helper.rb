module ApplicationHelper
  def active_nav_class(link_path)
    current_page?(link_path) ?
      "bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium" :
      "text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium"
  end

  def current_user_root_path
    if user_signed_in?
      current_user.is_admin? ? admin_path : cabinet_path
    else
      root_path
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, "#", class: "add_fields", data: {id: id, fields: fields.delete("\n")})
  end
end
