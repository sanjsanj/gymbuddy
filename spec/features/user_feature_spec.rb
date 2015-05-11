require 'rails_helper'

feature 'User signs up and makes profile' do
  scenario 'User signs up' do
    visit '/users/sign_up'
    fill_in 'Email', with: 't@t.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    fill_in 'Fitness bio', with: 'Powerlifting, also light golf'
    fill_in 'Name', with: 'George'
    choose 'Male'
    select('Beginner', :from => 'Fitness Level')
    attach_file('post_image', 'spec/feature/images/me.jpg')
    click_button 'Sign up'
    expect(page).to have_content 'Welcome!'
  end
end
