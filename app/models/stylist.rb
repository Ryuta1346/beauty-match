class Stylist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :category
  belongs_to :salon
  has_many :menus

  validates :name, presence: true, length: { maximum: 20 }
  validates :tel, presence: true, length: { maximum: 11, minimum: 11 }, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :stylist_since, presence: true
  validates :activity_scope, presence: true
  validates :cut_price, presence: true
  validates :features, presence: true
end
