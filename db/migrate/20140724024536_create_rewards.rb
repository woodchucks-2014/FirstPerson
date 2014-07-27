class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.belongs_to :quest
      t.text :description

      t.timestamps
    end
  end
end
