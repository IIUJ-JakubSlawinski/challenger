class Meeting < ActiveRecord::Base
  belongs_to :place
  belongs_to :league
  attr_accessible :description, :name
end
