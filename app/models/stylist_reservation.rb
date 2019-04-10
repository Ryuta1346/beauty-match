class StylistReservation < ApplicationRecord
  belongs_to :stylist
  has_one :reservation
  # belongs_to :menu

  default_scope -> { order(book_time: :asc) }
end
