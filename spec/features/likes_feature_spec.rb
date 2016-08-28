require 'rails_helper'
require_relative 'feature_helper.rb'

feature 'liking posts' do
  before do
    User.create(email: 'test@email.com', password: '123456')
    post = Post.new(caption: 'burger', user_id: User.first.id)
    post.save(:validate => false)
  end

  it 'a user can like a post if signed in', js: true do
    sign_up
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content("1 Like")
  end

  # scenario 'a user can only like a post once' do
  #   sign_up
  #   visit '/posts'
  #   click_link 'Like'
  #   expect(page).to have_content('1 Like')
  # end

  # it 'displays the correct number of likes' do
  #   sign_up
  #   visit '/posts'
  #   click_link 'Like'
  #   expect(page).to have_content('1 Like')
  # end

end
