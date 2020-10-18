class Store < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :line_name, presence: true
  validates :station, presence:  true
  has_one :city
  has_many :public_holiday
  has_many :menus, dependent: :destroy, inverse_of: :store
  has_many :openings, dependent: :destroy, inverse_of: :store
  has_many :images, dependent: :destroy, inverse_of: :store
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  accepts_nested_attributes_for :menus, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :openings, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
end
