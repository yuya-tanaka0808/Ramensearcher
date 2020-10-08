class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.text :address, null: false
      t.string :contact
      t.string :line_name, null: false
      t.string :station, null: false
      t.integer :minutes_on_foot
      t.string :link
      t.text :open_closed
      t.text :regular_holiday
      t.text :note
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
