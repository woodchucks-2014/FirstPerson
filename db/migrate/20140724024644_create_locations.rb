class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :latitude
      t.integer :longitude
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
