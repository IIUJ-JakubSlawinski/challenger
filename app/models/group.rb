class Group < ActiveRecord::Base
  attr_accessible :city, :name
  has_many :users
end
