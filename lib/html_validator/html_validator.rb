require 'nokogiri'

module HtmlValidator
  Xsd = Nokogiri::XML::Schema(open(File.join(File.dirname(__FILE__), 'xhtml1-strict.xsd')))
  
  def self.valid?(contents)
    Xsd.valid?(get_doc(contents))
  end
  
  def self.validate(contents)
    Xsd.validate(get_doc(contents))
  end

private

  def self.get_doc(contents)
    Nokogiri::XML(contents)
  end  
end
