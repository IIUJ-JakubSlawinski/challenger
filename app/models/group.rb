class Group < ActiveRecord::Base
    attr_accessible :city, :closed, :name
    
    has_and_belongs_to_many :users

    validates :name, presence: true, length: { maximum: 60 }
    validates :closed, presence: true
    validates :city, presence: true, length: { minimum: 3, maximum: 50 }

end
