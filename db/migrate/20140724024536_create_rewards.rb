class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.belongs_to :quest
      t.integer :xp

      t.timestamps
    end
  end
end
