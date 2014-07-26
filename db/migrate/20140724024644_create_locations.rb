class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :latitude
      t.integer :longitude
      t.string :name
      t.string :venue_type
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode

      t.timestamps
    end
  end
end
