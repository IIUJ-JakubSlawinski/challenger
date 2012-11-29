class Meeting < ActiveRecord::Base
  belongs_to :place
  belongs_to :league
  attr_accessible :description, :name, :place, :place_id

  validates :name, presence: true, length: { minimum: 3}
end
