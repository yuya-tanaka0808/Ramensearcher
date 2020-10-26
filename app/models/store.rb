class Store < ApplicationRecord
  has_many :menus, dependent: :destroy, inverse_of: :store
  has_many :openings, dependent: :destroy, inverse_of: :store
  has_many :images, dependent: :destroy, inverse_of: :store
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :reviews, dependent: :destroy
  has_many :review_users, through: :reviews, source: :user
  accepts_nested_attributes_for :menus, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :openings, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
  validates :name, :address, :line_name, :station,  presence: true
end
