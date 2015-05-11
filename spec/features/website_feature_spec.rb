require 'rails_helper'

feature 'Website homepage' do

  context 'When user not signed in' do

    scenario 'should direct to landing page and have welcome message' do
      visit '/'
      expect(page).to have_content 'Welcome'
      expect(current_path).to eq '/'
    end
  end

  context 'When user is signed in' do

    scenario 'should direct to posts page' do
      sign_up
      visit '/'
      expect(current_path).to eq '/posts'
    end
  end
end
