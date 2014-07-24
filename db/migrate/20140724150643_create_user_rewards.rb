class CreateUserRewards < ActiveRecord::Migration
  def change
    create_table :user_rewards do |t|
      t.belongs_to :reward
      t.belongs_to :user

      t.timestamps
    end
  end
end
