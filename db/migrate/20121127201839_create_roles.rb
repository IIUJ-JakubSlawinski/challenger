class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.integer :league_id
      t.integer :role

      t.timestamps
    end
    add_index :roles, :user_id
    add_index :roles, :league_id
  end
end
