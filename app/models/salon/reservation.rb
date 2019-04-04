class Salon::Reservation < ApplicationRecord
  belongs_to :salon
  belongs_to :prefecture

  validates :book_time, presence: true
end
