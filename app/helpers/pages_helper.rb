module PagesHelper
  def link_to_page(key)
    if (page = Page.published.find_by_key(key.to_s))
      link_to(page.title, page_path(page.slug))
    else
      "[ERROR: No published page with key: #{key}]"
    end
  end
  
  def render_page(page)
    raw ERB.new(page.body_html).result(binding)
  end
end
