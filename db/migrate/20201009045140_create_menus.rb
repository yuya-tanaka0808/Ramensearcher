class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :taste, null: false
      t.references :store, foreign_key: true
    end
  end
end
