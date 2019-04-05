class Salon < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :salon_reservations
  belongs_to :category
  belongs_to :prefecture

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :place, presence: true, uniqueness: true
  validates :manage, presence: true, length: { maximum: 20 }
  validates :tel, presence: true, length: { maximum: 11, minimum: 11 }, uniqueness: true
  validates :num_of_stylists, presence: true, length: { maximum: 50 }
  validates :num_of_sheets, presence: true, length: { maximum: 50 }
  validates :features, presence: true
  validates :cut_price, presence: true
end
