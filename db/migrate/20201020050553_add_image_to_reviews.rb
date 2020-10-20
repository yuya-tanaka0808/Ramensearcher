class AddImageToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :image, :text
  end
end
