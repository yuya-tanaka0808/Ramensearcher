class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.float :rating, null: false
      t.text :comment, null: false
      t.integer :user_id
      t.integer :store_id
      t.timestamps
    end
  end
end
