# == Schema Information
#
# Table name: leagues
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class League < ActiveRecord::Base
  belongs_to :place
  has_many :meetings

  has_many :roles
  has_many :users, through: :roles

  attr_accessible :name

  validates :name, presence: true, length: {maximum: 60, minimum: 2}, uniqueness: { case_sensitive: false }
end
