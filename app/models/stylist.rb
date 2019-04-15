class Stylist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :category
  belongs_to :salon
  has_many :menus
  has_many :stylist_reservations

  validates :name, presence: true, length: { maximum: 20 }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :tel, presence: true, uniqueness: true, format: { with: VALID_PHONE_REGEX }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :stylist_since, presence: true
  validates :activity_scope, presence: true
  validates :cut_price, presence: true
  validates :features, presence: true

  def reservation_management
    stylist_info = stylist_reservations.all
    Reservation.where(stylist_reservation_id: stylist_info).all
  end
end