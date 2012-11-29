# == Schema Information
#
# Table name: meetings
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  place_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  league_id   :integer
#

require 'spec_helper'

describe Meeting do
  before do
  	@meeting = Meeting.new(name: "Example", description: "Description")
  end

  subject { @meeting }

  it { should be_valid }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should belong_to(:place) }
  it { should belong_to(:league) }

  describe "when name is to short" do 
  		before { @meeting.name = "ab" }
  		it { should_not be_valid }
  	end  
end
