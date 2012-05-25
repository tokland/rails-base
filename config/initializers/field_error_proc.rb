ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  include ActionView::Helpers::OutputSafetyHelper
  raw %(<span class="field_with_errors">#{html_tag}</span>)
end
