class AddGenderIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender_id, :integer
  end
end
