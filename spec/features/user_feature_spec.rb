require 'rails_helper'

feature 'User signs up and makes profile' do
  scenario 'User signs up' do
    sign_up
    expect(page).to have_content 'Welcome!'
  end
end
