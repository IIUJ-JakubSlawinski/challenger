class CreateGroupsUsers < ActiveRecord::Migration
  def up
    create_table :groups_users, :id => false do |t|
      t.belongs_to :group, :user
      t.timestamps
    end
  end

  def down
    drop_table :groups_users
  end
end
