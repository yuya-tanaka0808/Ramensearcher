class Menu < ApplicationRecord
  belongs_to :store, inverse_of: :menus
  validates :name, presence:true
  validates :price, presence: true
  validates :taste, presence: true
end
