class StylistReservation < ApplicationRecord
  belongs_to :stylist
  # belongs_to :menu

  default_scope -> { order(book_time: :asc) }
end
