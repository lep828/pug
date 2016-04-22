class ChangeRoleInSubscribersToAdmin < ActiveRecord::Migration
  def change
    remove_column :subscribers, :role
    add_column :subscribers, :admin, :boolean
  end
end
