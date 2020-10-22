class ChangeColumnsToCitiesAndPublicHolidays < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :stores, :cities
    remove_foreign_key :stores, :public_holidays
    remove_reference :stores, :city
    remove_reference :stores, :public_holiday
  end
end
