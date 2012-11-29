class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.references :place

      t.timestamps
    end
    add_index :leagues, :place_id
  end
end
