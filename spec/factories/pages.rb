FactoryGirl.define do
  factory :page do
    language "en"
    slug { FactoryGirl.generate :slug }
    key { FactoryGirl.generate :key }
    title "title"
    body "body"
    body_html "<p>body</p>"
    status "draft"

    factory :draft_page do
      status "draft"
    end

    factory :published_page do
      status "published"
    end
    
    factory :help_page do
      title "Help"
      key "help"
      slug "help"
    end
  end
end
