require 'rails_helper'

RSpec.feature 'user types in localhost:3000' do
  describe 'and gets to homepage' do
    it "and sees login link" do
      visit '/'
      expect(page).to have_content("Login")
    end
  end
end
