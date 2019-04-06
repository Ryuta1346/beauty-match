FactoryBot.define do
  factory :salon do
    association :category
    association :prefecture
    sequence :name do |n|
      "Salon#{n}"
    end
    place { "MyString" }
    manage { "MyString" }
    tel { "00000000000" }
    sequence(:email) { |n| "salon#{n}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    num_of_stylists { 1 }
    num_of_sheets { 1 }
    features { "MyString" }
    cut_price { 4980 }
  end
end
