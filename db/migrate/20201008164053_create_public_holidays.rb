class CreatePublicHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :public_holidays do |t|
      t.date :date, null: false
    end
  end
end
