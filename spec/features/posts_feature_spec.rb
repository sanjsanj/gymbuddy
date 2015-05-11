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
      create_post
      expect(page).to have_content 'Post was successfully created.'
    end

    scenario 'users who are not signed in cannot post' do
      visit '/posts/new'
      expect(page).to have_content 'You need to sign in'
    end
  end

  context 'When viewing a post' do
    scenario 'it shows user profile details of post creator' do
      sign_up
      create_post
      click_link 'Show'
      expect(page).to have_content 'George'
      expect(page).to have_content 'Male'
      expect(page).to have_content 'Beginner'
      expect(page).to have_content 'Powerlifting'
    end
  end

  context 'when deleting a post' do
    # I know this is hideous, don't judge me, Sanjay
    scenario 'it only allows you to delete posts you made' do
      sign_up
      create_post
      expect(page).to have_content 'Destroy'
      visit '/'
      click_link 'Sign out'
      click_link 'Sign up'
      fill_in 'Email', with: 'g@g.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button 'Sign up'
      visit '/posts'
      expect(page).not_to have_content 'Destroy'
    end
  end
end
