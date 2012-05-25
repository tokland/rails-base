FactoryGirl.define do
  factory :page do
    language "en"
    slug { FactoryGirl.generate :slug }
    key { FactoryGirl.generate :key }
    title "title"
    body "body"
    body_html "<p>body</p>"
    state "draft"

    factory :draft_page do
      state "draft"
    end

    factory :published_page do
      state "published"
    end
  end
end
