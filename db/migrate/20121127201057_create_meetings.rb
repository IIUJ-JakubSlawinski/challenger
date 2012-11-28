class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :description
      t.references :place

      t.timestamps
    end
    add_index :meetings, :place_id
  end
end
