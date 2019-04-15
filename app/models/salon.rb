class Salon < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :salon_reservations
  has_many :stylists
  belongs_to :category
  belongs_to :prefecture

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :place, presence: true, uniqueness: true
  validates :manage, presence: true, length: { maximum: 20 }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :tel, presence: true, uniqueness: true, format: { with: VALID_PHONE_REGEX }
  validates :num_of_stylists, presence: true, length: { maximum: 50 }
  validates :num_of_sheets, presence: true, length: { maximum: 50 }
  validates :features, presence: true
  validates :cut_price, presence: true

  def reservation_management
    salon_info = salon_reservations.all
    Reservation.where(salon_reservation_id: salon_info).all
  end
end
