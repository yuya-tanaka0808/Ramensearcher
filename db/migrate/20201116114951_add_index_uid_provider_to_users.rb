class AddIndexUidProviderToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :uid, unique: true
    add_index :users, :provider, unique: true
  end
end
