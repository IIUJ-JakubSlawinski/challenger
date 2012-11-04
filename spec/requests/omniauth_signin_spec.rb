require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "With omniauth" do
    before { visit root_path }

    describe "sign up with valid credentials" do
      let(:user) { FactoryGirl.build(:user) }
      before do
          configure_valid_mock_fb_auth(user)
          click_link "Sign in with FB"
      end

      it { should have_content "Successfully signed in with facebook" }
      it { should have_selector "h1", text: user.name }

      describe "sign out and sign in again" do
        before do
          click_link "Sign out"
          click_link "Sign in with FB"
        end

        it { should have_content "Successfully signed in with facebook" }
        it { should have_selector "h1", text: user.name }
      end
    end

    describe "sign with used already email to sign up" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        configure_valid_mock_fb_auth(user)
        click_link "Sign in with FB"
      end
      
      it { should have_content "Email your facebook has provided was already used to signup" }
      it { should_not have_selector "h1", text: user.name }
    end

    describe "sign up with invalid credentials" do
      let(:user) { FactoryGirl.build(:user) }
      before do
          configure_invalid_mock_fb_auth
          click_link "Sign in with FB"
      end

      it { should have_content "Error" }
      it { should_not have_selector "h1", text: user.name }
    end
  end



end