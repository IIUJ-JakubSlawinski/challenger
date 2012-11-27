class League < ActiveRecord::Base
  belongs_to :place
  has_many :meetings

  has_many :roles
  has_many :users, through: :roles

  attr_accessible :name
end
