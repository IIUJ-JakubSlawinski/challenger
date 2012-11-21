require 'spec_helper'

describe Group do
  
  before do 
  	@group = Group.new(name: "Example Group", closed: true, city: "Krakow")
  end

  subject { @group }

  it { should respond_to(:name) }
  it { should respond_to(:closed) }
  it { should respond_to(:city) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @group.name = " " }
  	it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @group.city = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @group.name = "none" * 20 }
    it { should_not be_valid }
  end

  describe "when city name is too short" do
    before { @group.city = "cr" }
    it { should_not be_valid }
  end

  describe "when city name is too long" do
    before { @group.name = "none" * 20 }
    it { should_not be_valid }
  end

end
