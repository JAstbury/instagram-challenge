require 'rails_helper'
require_relative 'feature_helper.rb'

feature 'comments' do

  before do
    User.create(email: 'test@email.com', password: '123456')
    post = Post.new(caption: 'burger', user_id: User.first.id)
    post.save(:validate => false)
  end

  scenario 'users can leave comments on a post' do
    sign_up
    click_link 'Comment'
    fill_in "Thoughts", with: "Nice pic, bro!"
    click_button 'Leave Comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content('Nice pic, bro!')
  end

  # scenario 'user can delete their comments' do
  #   visit '/posts'
  #   click_link 'x'
  #   expect(page).not_to have_content 'Nice pic, bro!'
  #   expect(page).to have_content 'Comment deleted!'
  # end

  scenario 'user can only comment while signed in' do
    visit '/posts'
    expect(page).not_to have_content 'Comment'
  end
end
