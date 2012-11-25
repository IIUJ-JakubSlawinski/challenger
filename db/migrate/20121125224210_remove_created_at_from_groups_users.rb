class RemoveCreatedAtFromGroupsUsers < ActiveRecord::Migration
  def up
    remove_column :groups_users, :created_at
  end

  def down
    add_column :groups_users, :created_at, :datetime
  end
end
