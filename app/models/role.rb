# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  league_id  :integer
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :league
  attr_accessible :league_id, :role, :user_id

  validates :role, presence: true
end
