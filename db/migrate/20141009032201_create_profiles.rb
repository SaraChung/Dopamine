class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :gender
      t.float :latitude
      t.float :longitude
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.integer :age
      t.text :location
      t.integer :search_distance, :default => 1
      t.integer :search_age, :default => 1
      t.string :profile_picture
      
      t.timestamps
    end
  end
end
