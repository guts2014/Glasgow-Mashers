require 'rails_helper'

RSpec.describe Customer, :type => :model do
  describe "test customers" do
  	it "should have a valid factory" do
  		FactoryGirl.create(:customer, :trait => "Perfections").should be_valid
  	end

  	it "should have a name" do
  		FactoryGirl.build(:customer, :name => nil).should_not be_valid
  	end

  	it "should have a trait" do
  		FactoryGirl.build(:customer, :trait => nil).should_not be_valid
  	end

  	it "should have a positive affluence" do
  		FactoryGirl.build(:customer, :affluence => 0).should_not be_valid
  	end


  end
end
