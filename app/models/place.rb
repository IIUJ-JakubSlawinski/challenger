# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city       :string(255)
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Place < ActiveRecord::Base
  attr_accessible :address, :city, :name
  validates :name, presence: true, length: { minimum: 3}
  validates :city, presence: true
  validates :address, presence: true
end
