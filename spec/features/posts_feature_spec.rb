require 'rails_helper'

feature 'Posts' do

  context 'Website on initialization' do
    scenario 'should have no posts' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end

    scenario 'should display a prompt to create new posts' do
      visit '/posts'
      expect(page).to have_link 'New Post'
    end
  end
  context 'When creating a post' do
    scenario 'it shows the post' do
      sign_up
      visit '/posts'
      click_link 'New Post'
      select 'Swimming', from: 'Activity'
      select 'Virgin Active Molegate', from: 'Location'
      select_date_and_time(DateTime.now)
      click_button 'Create Post'
      expect(page).to have_content 'Post was successfully created.'
    end

    scenario 'users who are not signed in cannot post' do
      visit '/posts/new'
      expect(page).to have_content 'You need to sign in'
    end
  end
end
