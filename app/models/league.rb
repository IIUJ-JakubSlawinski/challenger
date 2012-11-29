class League < ActiveRecord::Base
  belongs_to :place
  has_many :meetings

  has_many :roles
  has_many :users, through: :roles

  attr_accessible :name, :place, :place_id

  validates :name, presence: true, length: {maximum: 60, minimum: 2}, uniqueness: { case_sensitive: false }
end
