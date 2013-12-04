require 'spec_helper'

# In order to track user sessions and provide
# personalized experience,
# as an Admin,
# I want to use Facebook auth for login

feature 'user logs in via Facebook', js: true do
	scenario 'attempt successful' do
		visit root_path

		click_link 'Sign in with Facebook'

		expect(current_path).to eql root_path
	end
end