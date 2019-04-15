class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.string :image
      t.string :url
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :restaurant_name
      t.integer :taste
      t.integer :cost_performance
      t.integer :service
      t.integer :atmosphere
      t.text :reputation
      t.string :genre
      t.timestamps
    end
  end
end
