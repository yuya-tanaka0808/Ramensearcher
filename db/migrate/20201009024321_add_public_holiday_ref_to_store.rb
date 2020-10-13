class AddPublicHolidayRefToStore < ActiveRecord::Migration[5.2]
  def change
    add_reference :stores, :public_holiday, foreign_key: true
  end
end
