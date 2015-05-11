require 'rails_helper'

feature 'Posts' do
  context 'Website on initialization' do
    scenario 'should have no posts' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end
  end
end
