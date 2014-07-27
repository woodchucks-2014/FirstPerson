class ChangeLocations < ActiveRecord::Migration
  def up
		remove_column :locations, :address, :string
		add_column :locations, :street, :string
		add_column :locations, :city, :string
		add_column :locations, :state, :string
		add_column :locations, :zip, :string
		add_column :locations, :country, :string
		add_column :locations, :foursquare_id, :string
		add_column :locations, :second_type, :string	
  end
  def down
  	add_column :address, :locations, :string
		remove_column :street, :locations, :string
		remove_column :city, :locations, :string
		remove_column :state, :locations, :string
		remove_column :zip, :locations, :string
		remove_column :country, :locations, :string
		remove_column :foursquare_id, :locations, :string
		remove_column :second_type, :locations, :string
	end

end
