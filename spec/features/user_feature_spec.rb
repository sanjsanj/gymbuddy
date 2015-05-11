require 'rails_helper'

feature 'User signs up and makes profile' do
  scenario 'User signs up' do
    visit '/users/sign_up'
    fill_in 'Email', with: 't@t.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    # fill_in 'Name', with: 'George'
    # choose 'user_gender_male'
    # fill_in 'Fitness bio', with: 'Powerlifting, also light golf'
    # select('Beginner', :from => 'Fitness level')
    # attach_file('user_image', 'spec/features/images/me.jpg')
    click_button 'Sign up'
    expect(page).to have_content 'Welcome!'
  end
end
