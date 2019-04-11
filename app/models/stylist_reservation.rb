class StylistReservation < ApplicationRecord
  belongs_to :stylist
  has_one :reservation

  default_scope -> { order(book_time: :asc) }

  def simple_time
    "#{book_time.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[book_time.wday]}曜日 %H:%M")}"
  end

  def book_stylist
    "【#{stylist.name}】:#{book_time.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[book_time.wday]}曜日 %H:%M")}"
  end
end
