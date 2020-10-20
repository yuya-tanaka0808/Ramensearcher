class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store
  mount_uploader :image, ImageUploader
end
