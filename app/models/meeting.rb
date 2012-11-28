class Meeting < ActiveRecord::Base
  belongs_to :place
  belongs_to :league
  attr_accessible :description, :name

  validates :name, presence: true, length: { minimum: 3}
end
