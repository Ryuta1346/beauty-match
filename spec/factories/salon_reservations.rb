FactoryBot.define do
  factory :salon_reservation, class: 'Salon::Reservation' do
    book_time { "2019-04-04 22:13:24" }
    salon { nil }
    prefecture { nil }
  end
end
