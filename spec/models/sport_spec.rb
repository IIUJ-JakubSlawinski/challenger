require 'spec_helper'

describe Sport do
  
  before { @sport = Sport.new(name: "Darts") }

  subject { @sport }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do 
  	before { @sport.name = " " }
  	it { should_not be_valid }
  end

  describe "when sport name is too short" do
    before { @sport.name = "x" }
    it { should_not be_valid }
  end
end
