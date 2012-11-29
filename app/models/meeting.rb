# == Schema Information
#
# Table name: meetings
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  place_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  league_id   :integer
#

class Meeting < ActiveRecord::Base
  belongs_to :place
  belongs_to :league
  attr_accessible :description, :name

  validates :name, presence: true, length: { minimum: 3}
end
