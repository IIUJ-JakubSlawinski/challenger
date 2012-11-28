class Place < ActiveRecord::Base
  attr_accessible :address, :city, :name
  validates :name, presence: true, length: { minimum: 3}
  validates :city, presence: true
end
