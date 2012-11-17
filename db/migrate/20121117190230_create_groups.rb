class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :city
      t.boolean :closed

      t.timestamps
    end
  end
end
