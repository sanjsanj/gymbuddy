require 'rails_helper'

feature 'Website homepage' do

  context 'When user not signed in' do

    scenario 'should direct to landing page and have welcome message' do
      visit root_path
      expect(page).to have_content 'Find Your Gym'
      expect(current_path).to eq root_path
    end

    scenario 'should not be able to view post details' do
      sign_up
      create_post
      click_link 'Sign out'
      visit posts_path
      expect(page).not_to have_link 'Show'
    end
  end

  context 'When user is signed in' do

    before do
      sign_up
      create_post
    end

    scenario 'should direct to posts page' do
      visit root_path
      expect(current_path).to eq posts_path
    end

    scenario 'should be able to view post details' do
      visit posts_path
      expect(page).to have_link 'Show'
    end

    scenario 'can send a message to gym buddies' do
      click_link 'Show'
      expect(page).to have_link 'Send Message'
    end
  end
end
