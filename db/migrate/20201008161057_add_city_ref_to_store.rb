class AddCityRefToStore < ActiveRecord::Migration[5.2]
  def change
    add_reference :stores, :city, foreign_key: true
  end
end
