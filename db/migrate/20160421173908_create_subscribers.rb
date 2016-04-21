class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :role
      t.integer :user_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
