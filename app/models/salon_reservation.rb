class SalonReservation < ApplicationRecord
  belongs_to :salon

  default_scope -> { order(book_time: :asc) }
end
