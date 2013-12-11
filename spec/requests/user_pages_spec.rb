require 'spec_helper'

describe "User Pages" do
  
  subject { user }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up')}
    it { should have_title('Sign up')}
  end
end
