require 'rails_helper'
require 'spec_helpers/helpers'

feature 'Posts' do
  def sign_up
    visit '/users/sign_up'
    fill_in 'Email', with: 't@t.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    fill_in 'Name', with: 'George'
    select('Male', :from => 'Gender')
    fill_in 'Fitness bio', with: 'Powerlifting, also light golf'
    select('Beginner', :from => 'Fitness level')
    attach_file('user_image', 'spec/features/images/me.jpg')
    click_button 'Sign up'
  end

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