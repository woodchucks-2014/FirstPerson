class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.belongs_to :creator
      t.string :category
      t.string :description
      t.integer :user_limit, default: -1 #-1 will mean unlimited... somehow
      t.datetime :start_date
      t.datetime :end_date
      t.text :title
      t.integer :xp, :default => 50
      t.string :timestatus, default: "current"
      t.string :userstatus, default: "open"

      t.timestamps
    end
  end
end
