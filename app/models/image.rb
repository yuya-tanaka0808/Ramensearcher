class Image < ApplicationRecord
  belongs_to :store, inverse_of: :images
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
