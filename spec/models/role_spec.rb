require 'spec_helper'

describe Role do
  before do
  	@role = Role.new(role: "admin")
  end

  subject { @role }

  it { should be_valid }
  it { should respond_to(:role) }
  it { should belong_to(:user) }
  it { should belong_to(:league) }

  describe "when role is empty" do 
  		before { @role.role = " " }
  		it { should_not be_valid }
  end 
end
