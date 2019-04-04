class SalonReservation < ApplicationRecord
  belongs_to :salon
  belongs_to :prefecture
end
