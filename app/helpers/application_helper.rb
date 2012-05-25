module ApplicationHelper
  def json(obj)
    raw(obj.to_json)
  end

  def hidden_fields_for_params(params)
    params.except(:action, :controller, :id, :locale).map do |key, value|
      hidden_field_tag(key, value) 
    end.safe_join
  end
  
  def upload_iframe(name, options = {})
    options.reverse_update(:debug => false)
    content_tag(:iframe, "", {
      :id => name,
      :name => name,
      :style => (options[:debug] ? nil : "width:1px;height:1px;border:0px"),
    })
  end
    
  def render_join(collection, join_string, &block)
    output = collection.map { |item| capture(item, &block) }
    concat(safe_join(output))
  end

  def strong(html)
    content_tag(:strong, html)
  end
  
  def classes(names)
    names.reject(&:blank?).join(" ")
  end

  def date(date_value, options = {})
    date_value ? I18n.l(date_value, options) : "-"
  end

  # Initialize a Javascript ItemsList
  def init_items_list(form, options = {}, &block)
    options.reverse_update({
      selectors: {
        box: "#items-box",
        item_box: ".item-box",
        add: ".add",
        remove: ".remove",
        delete_field: ".delete-field",
      },
      messages: {
        confirm_remove: I18n.t("views.common.confirm_remove"),
      },
      child_index: '_child_index_',
      template: capture(form, &block),
    })

    javascript_tag %Q{var items_list = new ItemsList(#{options.to_json});}
  end

  def link_to_remove_item(options = {})
    options.reverse_update(:confirmation => true)
    link_to_js(image_tag("ico_eliminar.png"), 
      :class => "remove", 
      :"data-confirmation" => (options[:confirmation] ? "1" : nil))
  end
  
  # Render HTML in block using a sidemenu
  def with_sidemenu(resource_name, current_section, options = {}, &block)
    options.reverse_update(:property => nil) 
    render({
      :partial => "/layouts/sidemenu",
      :locals => {
        :property => options[:property],
        :sidemenu => render(:partial => "/#{resource_name}/menu",
                            :locals => {:current_section => current_section}),
        :contents => capture(&block),
      },
    })
  end
  
  def translated_options_for_select(model, attribute, values)
    values.map do |value|
      caption = I18n.t("activerecord.attributes.#{model}.#{attribute.to_s.pluralize}.#{value}")
      [caption.capitalize, value]
    end  
  end

  def javascript_include_tag_on_head(*files)
    content_for :javascript do
      javascript_include_tag(*files)
    end
  end

  def javascript_on_load(&block)
    content_for :javascript do
      javascript_tag "$(function() { %s });" % capture(&block)
    end
  end
  
  def link_to_js(name, *args)
    link_to(name, "javascript:void(0)", *args)  
  end
end
