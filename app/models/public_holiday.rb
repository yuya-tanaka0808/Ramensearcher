class PublicHoliday < ApplicationRecord
  validates :date, presence: true
end
