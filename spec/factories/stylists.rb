FactoryBot.define do
  factory :stylist do
    association :salon
    association :category
    sequence(:name) { |n| "HurryPotter#{n}" }
    tel { "00000000000" }
    email { "MyString" }
    stylist_since { "2019-04-01" }
    activity_scope { "MyString" }
    cut_price { 1 }
    features { "Mystring" }
  end
end
