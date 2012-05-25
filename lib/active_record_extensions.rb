class ActiveRecord::Base
  # User.han(:name) #=> "Name" 
  def self.han(attribute)
    human_attribute_name(attribute).titleize
  end

  # User.human_name_singular #=> "user"
  def self.human_name_singular
    self.model_name.human.downcase
  end

  # User.human_name_plural(:name) #=> "users"
  def self.human_name_plural
    I18n.t("activerecord.models.#{self.model_name.underscore}", :count => 2)
  end
  
  # User.han_option(user, :state) #=> "active"
  def self.han_option(object, attribute, options = {})
    options.reverse_update(:default_string => "-")
    value = object.send(attribute)
    return options[:default_string] unless value.present?
     
    i18n_keys = [
      "activerecord.attributes",
      object.class.name.underscore,
      attribute.to_s.pluralize,
      value,
    ]
    I18n.t(i18n_keys.join("."), :default => options[:default_string]).titleize
  end
  
  def self.find_or_create!(find_attributes, attributes = {})
    record = where(attributes.slice(*find_attributes)).first || new(attributes)
    record.update_attributes!(attributes)
    record
  end
end
