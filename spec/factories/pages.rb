FactoryGirl.define do
  factory :page do
    language "en"
    slug "slug"
    key "key"
    title "title"
    body "body"
    body_html "<p>body</p>"
    status "draft"
    
    factory :help_page do
      title "Help"
      key "help"
      slug "help"
    end
  end
end
