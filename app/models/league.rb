class League < ActiveRecord::Base
  belongs_to :group
  attr_accessible :name
end
