class Store < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :line_name, presence: true
  validates :station, presence:  true
  has_one :city
  has_many :public_holiday
  has_many :menus, dependent: :destroy
end
