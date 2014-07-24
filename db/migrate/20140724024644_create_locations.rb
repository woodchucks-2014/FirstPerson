class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :lat
      t.integer :lng
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
