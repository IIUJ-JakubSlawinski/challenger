class Meeting < ActiveRecord::Base
  belongs_to :place
  attr_accessible :description, :name
end
