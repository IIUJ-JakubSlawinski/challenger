class Role < ActiveRecord::Base
  attr_accessible :league_id, :role, :user_id
end
