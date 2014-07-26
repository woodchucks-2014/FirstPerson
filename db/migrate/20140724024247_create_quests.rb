class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.belongs_to :creator
      t.string :category
      t.integer :user_limit, default: -1 #-1 will mean unlimited... somehow
      t.datetime :start_date
      t.datetime :end_date
      t.text :title

      t.timestamps
    end
  end
end
