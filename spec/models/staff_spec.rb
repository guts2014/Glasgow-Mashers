require 'rails_helper'

RSpec.describe Staff, :type => :model do
  describe "Testing staff" do
  	it "should have a valid factory" do
  		FactoryGirl.create(:staff).should be_valid
  	end

  	it "should not have negative happiness" do
  		FactoryGirl.build(:staff, :happiness => -1 ).should_not be_valid
  	end

  	it "should have a name" do
  		FactoryGirl.build(:staff, :name => nil).should_not be_valid
  	end

  	it "should have a positive salary" do
  		FactoryGirl.build(:staff, :salary => -1).should_not be_valid
  	end

  	it "should have a trait" do
  		FactoryGirl.build(:staff, :trait_id => nil).should_not be_valid
  	end
  end
end
