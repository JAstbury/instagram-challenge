require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
  before do
    Post.create(caption: 'burger')
  end

  scenario 'display posts' do
    visit '/posts'
    expect(page).to have_content('burger')
    expect(page).not_to have_content('No posts yet')
  end
  end

  context 'creating posts' do
  scenario 'prompts user to fill out a form and displays new post' do
    visit '/posts'
    click_link 'Add a post'
    fill_in 'Caption', with: 'burgers'
    click_button 'Create Post'
    expect(page).to have_content 'burgers'
    expect(current_path).to eq '/posts'
  end
  end
end
