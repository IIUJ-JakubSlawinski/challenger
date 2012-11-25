class League < ActiveRecord::Base
  belongs_to :group
  attr_accessible :name

   validates :name, presence: true, length: { minimum: 2 }
end
