class Menu < ApplicationRecord
  belongs_to :store, inverse_of: :menus
  validates :name, :price, :taste presence:true
end
