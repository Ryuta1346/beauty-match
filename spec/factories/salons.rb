FactoryBot.define do
  factory :salon do
    association :category
    association :prefecture
    name { "RAIMU" }
    place { "MyString" }
    manage { "MyString" }
    tel { "00000000000" }
    email { "test@example.com" }
    num_of_stylists { 1 }
    num_of_sheets { 1 }
    features { "MyString" }
    cut_price { 4980 }
  end
end
