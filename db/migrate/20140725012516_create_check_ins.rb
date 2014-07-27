class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.belongs_to :location
      t.belongs_to :user
      t.integer :xp

      t.timestamps
    end
  end
end
