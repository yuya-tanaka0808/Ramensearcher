class Store < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :line_name, presence: true
  validates :station, presence:  true
end
