require 'rails_helper'

feature 'Posts' do

  context 'Website on initialization' do

    scenario 'should have no posts' do
      visit posts_path
      expect(page).to have_content 'No posts yet'
    end

    scenario 'should display a prompt to create new posts' do
      visit posts_path
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
      visit new_post_path
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

    # scenario 'it can filter by gender' do
    #   sign_up('g@g.com', 'Female')
    #   create_post('Running')
    #   click_link 'Sign out'
    #   sign_up
    #   create_post
    #   select 'Male', :from => "gender_menu"
    #   expect(page).to have_content 'Swimming'
    #   expect(page).not_to have_content 'Running'
    # end
  end

  context 'when deleting a post' do
    scenario 'you cannot delete a post that isn\'t yours' do
      sign_up
      create_post
      expect(page).to have_content 'Destroy'
      visit root_path
      click_link 'Sign out'
      sign_up(email: 'g@g.com')
      visit posts_path
      expect(page).not_to have_content 'Destroy'
    end

    scenario 'you can delete your own psot' do
      sign_up
      create_post
      click_link 'Destroy'
      expect(page).to have_content 'Post was successfully destroyed'
    end
  end
end
