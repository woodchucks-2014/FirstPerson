class CreateUserCheckpoints < ActiveRecord::Migration
  def change
    create_table :user_checkpoints do |t|
      t.belongs_to :checkpoint
      t.belongs_to :user
      t.boolean :completed, :default => false

      t.timestamps
    end
  end
end
