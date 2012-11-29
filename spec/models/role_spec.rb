# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  league_id  :integer
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
