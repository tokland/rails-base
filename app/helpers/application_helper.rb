module ApplicationHelper
  def hello
    'hello'
  end

  def javascript_include_tag_on_head(*files)
    content_for :javascript do
      javascript_include_tag(*files)
    end
  end

  def javascript_on_load(&block)
    content_for :javascript do
      javascript_tag %Q{
        $(function() { #{capture(&block)} }); 
      }
    end
  end
end
