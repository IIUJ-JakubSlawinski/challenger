require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "With omniauth" do
    before { visit root_path }

    describe "sign up with valid credentials" do
      let(:user) { FactoryGirl.build(:user) }
      before do
          configure_valid_mock_fb_auth(user)
      end

      it "should create a user" do
        expect { click_link "Sign in with FB" }.to change(User, :count)
      end

      describe "and redirect back to user page" do
        before { click_link "Sign in with FB" }

        it { should have_content "Successfully signed in with facebook" }
        it { should have_selector "h1", text: user.name }

        describe "followed by sign out and sign in again" do
          before do
            click_link "Sign out"
          end

          it "should not create a user" do
            expect { click_link "Sign in with FB" }.not_to change(User, :count)
          end

          describe "and redirect back to user page" do
            before { click_link "Sign in with FB" }

            it { should have_content "Successfully signed in with facebook" }
            it { should have_selector "h1", text: user.name }
          end
        end
      end
    end

    describe "sign with used already email to sign up" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        configure_valid_mock_fb_auth(user)
      end

      it "should not create a user" do
        expect { click_link "Sign in with FB" }.not_to change(User, :count)
      end

      describe "and redirect back to root page" do
        before { click_link "Sign in with FB" }
      
        it { should have_content "Email your facebook has provided was already used to signup" }
        it { should_not have_selector "h1", text: user.name }
      end
    end

    describe "sign up with invalid credentials" do
      let(:user) { FactoryGirl.build(:user) }
      before do
          configure_invalid_mock_fb_auth
      end

      it "should not create a user" do
        expect { click_link "Sign in with FB" }.not_to change(User, :count)
      end

      describe "and redirect back to root page" do
        before { click_link "Sign in with FB" }
      
        it { should have_content "Error" }
        it { should_not have_selector "h1", text: user.name }
      end
    end
  end



end