RSpec::Matchers.define :be_valid_xhtml do |expected|
  description { "be valid XHTML" }
    
  match do |response|
    HtmlValidator.valid?(response.body)
  end

  failure_message_for_should do |response|
    errors = HtmlValidator.validate(response.body)
    "expected that response body would be valid XHTML:\n\n#{errors.join('\n')}"
  end

  failure_message_for_should_not do |response|
    "expected that response body wouldn't be valid XHTML"
  end
end
