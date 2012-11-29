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

require 'spec_helper'

describe Place do
  before do
  	@place = Place.new(name: "Omerta", city: "Krakow", address: "Kupa 3")
  end
  
  subject { @place }

  it { should be_valid }
  
  it { should respond_to(:name) }
  it { should respond_to(:city) }	
  it { should respond_to(:address) }

  describe "when name is to short" do 
  		before { @place.name = " " }
  		it { should_not be_valid }
  end

  describe "when city is empty" do 
  		before { @place.city = " " }
  		it { should_not be_valid }
  end 

  describe "when address is empty" do 
  		before { @place.address = " " }
  		it { should_not be_valid }
  end 
end
