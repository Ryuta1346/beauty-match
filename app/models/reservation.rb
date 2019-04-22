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

  #以下メソッドは今後リファクタリング予定

  # サロンの予約管理
  def self.get_incomplete_reservation(current_salon)
    salon_data = SalonReservation.where(salon_id: current_salon).where("book_time >= ?", DateTime.now).ids
    where(salon_reservation_id: salon_data, finish_salon: false).all
  end

  # サロンの取引管理
  def self.get_complete_reservation(current_salon)
    salon_data = SalonReservation.where(salon_id: current_salon).ids
    where(salon_reservation_id: salon_data, finish_salon: true).all
  end

  # サロンの取引スタイリスト管理
  def self.get_trading_history(current_salon)
    salon_data = SalonReservation.where(salon_id: current_salon).ids
    where(salon_reservation_id: salon_data).all
  end

  # スタイリストの予約管理の一覧ページ
  def self.incomplete_stylist_reservation(current_stylist)
    stylist_data = StylistReservation.where(stylist_id: current_stylist).where("book_time >= ?", DateTime.now).ids
    Reservation.where(stylist_reservation_id: stylist_data, finish_stylist: false).all
  end

  # スタイリストの取引管理一覧ページ
  def self.complete_stylist_reservation(current_stylist)
    stylist_data = StylistReservation.where(stylist_id: current_stylist).ids
    Reservation.where(stylist_reservation_id: stylist_data, finish_stylist: true).all
  end
end