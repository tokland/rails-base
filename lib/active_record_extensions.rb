class ActiveRecord::Base
  def self.find_or_create!(find_attributes, attributes = {})
    record = where(attributes.slice(*find_attributes)).first ||
             new(attributes)
    record.update_attributes!(attributes)
    record
  end
end
