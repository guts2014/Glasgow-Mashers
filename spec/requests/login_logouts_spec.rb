require 'rails_helper'

RSpec.describe "LoginLogouts", :type => :request do
  describe "Login/Logut" do

  	before :each do
  		visit root_path
  	end

    it "should create new user" do
      click_link 'New account'
      fill_in 'Email', with: "mail@example.com"
      fill_in "Password", with: "password"
      fill_in 'Password confirmation', with: "password"
      click_button "Sign up"
      expect(User.count).to eq(1)
    end


  end
end
