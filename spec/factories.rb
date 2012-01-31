FactoryGirl.define do
  sequence(:email) { |n| "email#{n}@factory.com" }
  sequence(:key) { |n| "key-#{n}" }
  sequence(:slug) { |n| "slug-#{n}" }
end
