class RemoveUpdatedAtFromGroupsUsers < ActiveRecord::Migration
  def up
    remove_column :groups_users, :updated_at
  end

  def down
    add_column :groups_users, :updated_at, :datetime
  end
end
