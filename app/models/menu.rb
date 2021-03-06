class Menu < ApplicationRecord
  belongs_to :stylist
  has_many :reservations

  validates :menu_name, presence: true, length: { maximum: 30 }
  validates :menu_price, presence: true, length: { maximum: 5 }
  validates :operation_time, presence: true, length: { maximum: 5 }
  validates :content, length: { maximum: 255 }
  validates :memo, length: { maximum: 255 }

  def menu_manage
    "【#{stylist.name}】:#{menu_name}"
  end

  def menu_display
    "【#{menu_name}】:#{operation_time}分"
  end
end
