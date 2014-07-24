class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.belongs_to :quest
      t.belongs_to :location
      t.integer :step_num

      t.timestamps
    end
  end
end
