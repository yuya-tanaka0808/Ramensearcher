class Opening < ApplicationRecord
  belongs_to :store, inverse_of: :openings
  validates :open_hour,presence: true
  validates :last_order,presence: true
  validates :day_week,presence: true, format: { with: /[月火水木金土日祝]/ },length: { maximum: 8 }
  validates :weeks, presence: true, format: { with: /[0-5]/ },length: { maximum: 5 }
end
