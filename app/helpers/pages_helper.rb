module PagesHelper
  def link_to_page(key)
    if (page = Page.find_by_key(key.to_s))
      link_to(page.title, page_path(page))
    else
      "[ERROR: No page with key: #{key}]"
    end
  end
end
