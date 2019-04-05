FactoryBot.define do
  factory :salon_reservation do
    association :salon
    association :prefecture
    book_time { "2019-04-05 23:33:09" }
  end
end
