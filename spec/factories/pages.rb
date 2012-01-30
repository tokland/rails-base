FactoryGirl.define do
  factory :page do
    language "en"
    slug "slug"
    key "key"
    title "title"
    body "body"
    body_html "<p>body</p>"
    status "draft"
  end
end
