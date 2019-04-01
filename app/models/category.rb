class Category < ApplicationRecord
  has_many :salons

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
end
