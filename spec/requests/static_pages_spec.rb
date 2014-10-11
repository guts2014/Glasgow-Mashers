require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "GET /static_pages" do
  	subject {page}
    it "random test" do
      visit root_path
      expect(page).to have_content "Sign in"
      expect(page).to have_content "New_account"
      expect(page).to have_content "Glasgow Mashers"
    end
  end
end
