class Stylist < ApplicationRecord
  belongs_to :salon
  belongs_to :category

  validates :name, presence: true, length: { maximum: 20 }
  validates :tel, presence: true, length: { maximum: 11, minimum: 11 }, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :stylist_since, presence: true
  validates :activity_scope, presence: true
  validates :cut_price, presence: true
  validates :features, presence: true
end
