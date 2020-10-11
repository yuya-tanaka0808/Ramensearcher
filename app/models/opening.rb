class Opening < ApplicationRecord
  belongs_to :store
  enum day_week:  %i( mon tue wed thu fri sat sun pub )
end
