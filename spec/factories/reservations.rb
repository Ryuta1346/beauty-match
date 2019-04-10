FactoryBot.define do
  factory :reservation do
    user { nil }
    salon_reservation { nil }
    stylist_reservation { nil }
  end
end
