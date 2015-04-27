require 'rails_helper'

RSpec.describe User, :type => :model do
  before :each do
    @nilUser = FactoryGirl.build(:user, :email =>nil)
    @bad_email_user = FactoryGirl.build(:user, :email => "asldkfjsdl.39")
    @good_email_user = FactoryGirl.build(:user, :email => "hanspeter@example.com", :encrypted_password => "something", :password => "helloworlds")
  end

  describe '#email' do
  	it 'must have an email' do
  		expect(@nilUser).not_to be_valid
  	end
  	it "must be a valid email" do
      expect(@bad_email_user).not_to be_valid
      expect(@good_email_user).to be_valid
  	end
  end
end