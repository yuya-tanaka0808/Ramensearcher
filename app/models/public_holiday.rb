class PublicHoliday < ApplicationRecord
  validates :date, presence: true
  belongs_to :store
end
