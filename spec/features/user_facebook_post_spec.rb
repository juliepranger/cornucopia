require 'spec_helper'

# In order to integrate Cornucopia with Facebook
# as an Admin,
# I want the User to be able to like recipes which will connect to Facebook

feature 'user likes recipe, posts to Facebook', js: true do
	scenario 'attempt successful' do
		visit root_path

		click_button 'Post a recipe to Facebook action using og.likes'

		expect(current_path).to eql root_path
	end

end