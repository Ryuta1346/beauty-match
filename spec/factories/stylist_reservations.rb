FactoryBot.define do
  factory :stylist_reservation do
    association :stylist
    association :menu
    book_time { "2019-04-07 22:13:34" }
    memo { "MyString" }
  end
end
