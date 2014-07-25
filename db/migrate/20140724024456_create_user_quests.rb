class CreateUserQuests < ActiveRecord::Migration
  def change
    create_table :user_quests do |t|
      t.belongs_to :quest
      t.belongs_to :user
      t.boolean :completed, :default => false

      t.timestamps
    end
  end
end
