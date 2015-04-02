require 'rails_helper'

RSpec.describe "Organizations", :type => :request do
  describe "GET /organizations" do
    it "Should have a h1 'Organizations joined with us'" do
      visit organizations_path
      expect(page).to have_selector('h1', text: 'Organizations joined with us')
    end
  end
end
