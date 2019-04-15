class AddAddressIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address_id, :integer
  end
end
