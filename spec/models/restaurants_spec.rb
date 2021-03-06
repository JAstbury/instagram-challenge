require 'spec_helper'

describe Post, type: :model do
  it 'is not valid with a caption of less than three characters' do
    post = Post.new(caption: "Bu")
    expect(post).to have(1).error_on(:caption)
    expect(post).not_to be_valid
  end
end
