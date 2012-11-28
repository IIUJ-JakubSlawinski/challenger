class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :league
  attr_accessible :league_id, :role, :user_id

  validates :role, presence: true
end
