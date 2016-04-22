class CreateGamesGroups < ActiveRecord::Migration
  def change
    create_table :games_groups do |t|
      t.integer :game_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
