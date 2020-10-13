class ChangeNotNullNameToCities < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cities, :name, false
  end
end
