require 'spec_helper'

describe League do
  before do 
  	@league = Sport.new(name: "TeamA")
  end

  subject { @league }

  it { should respond_to(:name) }
  
  it { should be_valid }

  describe "when name is not present" do 
  	before { @league.name = " " }
  	it { should_not be_valid }
  end

  describe "when sport name is too short" do
    before { @league.name = "x" }
    it { should_not be_valid }
  end
end
