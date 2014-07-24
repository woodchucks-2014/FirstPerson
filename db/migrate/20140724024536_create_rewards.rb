class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.belongs_to :quest
      t.integer :xp, :default => 0

      t.timestamps
    end
  end
end
