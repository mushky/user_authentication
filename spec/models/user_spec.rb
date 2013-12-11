require 'spec_helper'

describe User do 
  
  before { @user = User.new(name: "butthead", email: "butthead@cacabutt.com"), password: "cacabutt", password_confirmation: 
  "cacabutt" }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }
  
  describe "when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = " "}
  	it { should_not be_valid }
  end

  describe "when a name is to long" do
  	before { @user.name = "a" * 51 }
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
  	it "should be invalid" do
  		addresses = %w[user@donkey,com user_at_donkey.org user.donkey@donkey.donkey@baronkey.com]
  		addresses.each do |invalid|
  			@user.email = invalid
  			expect(@user).not_to be_valid
  		end
  	end
  end

  describe "when email format is valid" do
    it "should be valid" do
    	addreses = %w[donkey@donkey.com donkey@donkey.COM donkay.donkey_donkey@donkey.com]
      addresses.each do |valid|
      	@user.email = valid
      	expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
  	before do 
  		user_with_same_email = @user.dup
  		user_With_Same_email.save
  		user_with_same_email.email = @user.email.upcase
    end

    it { should_not be_valid }
  end
end


