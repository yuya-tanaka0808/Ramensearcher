class Store < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :line_name, presence: true
  validates :station, presence:  true
  has_one :city
  has_many :public_holiday
  has_many :menus, dependent: :destroy, inverse_of: :store
  has_many :openings, dependent: :destroy, inverse_of: :store

  accepts_nested_attributes_for :menus, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :openings, reject_if: :all_blank, allow_destroy: true
end
