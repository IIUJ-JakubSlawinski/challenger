class Group < ActiveRecord::Base
    has_many :users
    attr_accessible :city, :closed, :name
end
