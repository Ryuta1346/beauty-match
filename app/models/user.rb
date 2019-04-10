class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 20 }
  validates :tel, presence: true, length: { maximum: 11, min: 11 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 50 }
  validates :birth_year, presence: true, length: { maximum: 4, min: 4 }
end
