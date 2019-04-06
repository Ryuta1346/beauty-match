FactoryBot.define do
  factory :stylist do
    association :salon
    association :category
    sequence(:name) { |n| "test-user#{n}" }
    tel { "00000000000" }
    sequence(:email) { |n| "test-user#{n}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    stylist_since { "2019-04-01" }
    activity_scope { "MyString" }
    cut_price { 1 }
    features { "Mystring" }
  end
end
