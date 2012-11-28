class AddLeagueIdToMeetingsTable < ActiveRecord::Migration
  def change
  	change_table :meetings do |t|
    	t.references :league
  	end
  end
end
