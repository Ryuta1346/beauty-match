class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :tel, presence: true, length: { maximum: 11, min: 11 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 50 }
  validates :birth_year, presence: true, length: { maximum: 4, min: 4 }
end
