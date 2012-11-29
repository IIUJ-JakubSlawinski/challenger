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

require 'spec_helper'

describe League do

	before do
		@league = League.new(name: "Example")
	end

	subject { @league } 

	it { should respond_to(:name) }
	it { should be_valid }

  	describe "when league.name is not present" do
    	before { @league.name = " " }
    	it { should_not be_valid }
  	end
	
	describe "when name is too long" do
    	before { @league.name = "sth" * 30 }
    	it { should_not be_valid }
  	end

  	describe "when name is to short" do 
  		before { @league.name = " " }
  		it { should_not be_valid }
  	end

    it { should respond_to(:roles) }
    it { should have_many(:roles) }

    it { should respond_to(:place) }
    it { should belong_to(:place) }

    it { should respond_to(:meetings) }
    it { should have_many(:meetings) }

    it { should respond_to(:users) }
    it { should have_many(:users) }
end
