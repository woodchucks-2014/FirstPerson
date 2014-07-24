class CreateUserQuests < ActiveRecord::Migration
  def change
    create_table :user_quests do |t|
      t.belongs_to :quest
      t.belongs_to :user
      t.boolean :completed?
      t.integer :current_checkpoint_id

      t.timestamps
    end
  end
end
