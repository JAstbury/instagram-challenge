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

  context 'an invalid post' do
    it 'does not let post with a caption that is too short' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'bu'
      click_button 'Create Post'
      expect(page).not_to have_css 'h4', text: 'kf'
      expect(page).to have_content 'error'
    end
  end
  end

  context 'editing posts' do

  before { Post.create caption: 'Hellooo Im a test post' }

  scenario 'user can edit their post' do
   visit '/posts'
   click_link 'Edit'
   fill_in 'Caption', with: 'Changing the caption'
   click_button 'Update Post'
   expect(page).to have_content 'Changing the caption'
   expect(page).not_to have_content 'Hellooo Im a test post'
   expect(current_path).to eq '/posts'
  end

end

context 'deleting posts' do

  before { Post.create caption: 'Delete me please' }

  scenario 'user can delete their post' do
    visit '/posts'
    click_link 'Delete'
    expect(page).not_to have_content 'Delete me please'
    expect(page).to have_content 'Post deleted!'
  end

end
end
