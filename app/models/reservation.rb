class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :salon_reservation
  belongs_to :stylist_reservation
  belongs_to :menu
  has_one :stylist_sales_memo

  validates :salon_reservation_id, :stylist_reservation_id, :menu_id, presence: true
  def book_time_management
    book_time = salon_reservation.book_time == stylist_reservation.book_time
    book_menu = stylist_reservation.stylist.name == menu.stylist.name
    book_time && book_menu
  end
end