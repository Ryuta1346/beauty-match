class SalonReservation < ApplicationRecord
  belongs_to :salon
  has_one :reservation

  default_scope -> { order(book_time: :asc) }

  def simple_time
    "#{book_time.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[book_time.wday]}曜日 %H:%M")}"
  end

  def book_salon
    "【#{salon.name}】:#{book_time.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[book_time.wday]}曜日 %H:%M")}"
  end

  def book_stylist
    salon_booking = salon_reservation.book_time
    StylistReservation.where(book_time: salon_booking).all
    "【#{stylist.name}】:#{book_time.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[book_time.wday]}曜日 %H:%M")}"
  end
end
