class CreateOpenings < ActiveRecord::Migration[5.2]
  def change
    create_table :openings do |t|
      t.time :open_hour, null: false
      t.time :last_order, null: false
      t.string :day_week, null: false
      t.string :weeks, null: false
      t.references :store, foreign_key: true
    end
  end
end
