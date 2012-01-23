module ApplicationHelper
  def hello
    'hello'
  end

  def javascript_include_tag_on_head(*files)
    content_tag :head do
      javascript_include_tag(*files)
    end
  end
end
