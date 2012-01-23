FactoryGirl.define do
  sequence :user_email do |n|
    "email#{n}@factory.com"
  end

  factory :car do
    name 'aa'
  end
end
