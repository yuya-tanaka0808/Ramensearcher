class Image < ApplicationRecord
  belongs_to :store, inverse_of: :images
  validates :image, presence: true
end
