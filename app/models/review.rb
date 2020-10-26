class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store
  validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5}
  validates :comment, presence: true
  mount_uploader :image, ImageUploader
end
