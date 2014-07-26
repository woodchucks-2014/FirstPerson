class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :name
      t.string :venue_type
      t.string :address

      t.timestamps
    end
  end
end
