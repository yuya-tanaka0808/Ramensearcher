class DropCitiesAndPublicHolidays < ActiveRecord::Migration[5.2]
  def change
    drop_table :cities
    drop_table :public_holidays
  end
end
