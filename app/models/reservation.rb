class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :salon_reservation
  belongs_to :stylist_reservation
  belongs_to :menu

  validates :salon_reservation_id, :stylist_reservation_id, :menu_id, presence: true
end
