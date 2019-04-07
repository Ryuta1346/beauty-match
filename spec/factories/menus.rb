FactoryBot.define do
  factory :menu do
    stylist { nil }
    menu_name { "MyString" }
    menu_price { 1 }
    operation_time { 1 }
    content { "MyString" }
    memo { "MyText" }
  end
end
