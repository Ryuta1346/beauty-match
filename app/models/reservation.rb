class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :salon_reservation
  belongs_to :stylist_reservation
end
