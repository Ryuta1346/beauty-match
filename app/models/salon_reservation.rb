class SalonReservation < ApplicationRecord
  belongs_to :salon
  has_one :reservation

  default_scope -> { order(book_time: :asc) }
end
