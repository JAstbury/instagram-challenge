require 'rails_helper'

feature 'comments' do

  before do
    post = Post.new(caption: 'burger')
    post.save(:validate => false)
  end

  scenario 'users can leave comments on a post' do
     visit '/posts'
     click_link 'Comment'
     fill_in "Thoughts", with: "Nice pic, bro!"
     click_button 'Leave Comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('Nice pic, bro!')
  end
end
