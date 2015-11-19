require 'rails_helper'
RSpec.describe Post, type: :model do
  before(:all) do
    @post = Post.new(title: 'My title', content: 'My content')
  end

  it 'should have a matching content' do
    expect(@post.content).to eq('My content')
  end

  it 'should have a matching title' do
    expect(@post.title).to eq('My title')
  end
end