class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.references :group

      t.timestamps
    end
    add_index :leagues, :group_id
  end
end
