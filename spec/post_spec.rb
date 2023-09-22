require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.new(author: @author, title: "My post", text: "This is my first post")
  end

  describe "#validation" do
    it "is valid with valid attributes" do
      expect(@post).to be_a(Post)
      expect(@post).to be_valid
    end
  end

  describe "#recent_comments" do
    it "should return a list of recent comments" do
      expect(@post.recent_comments).to eq(@post.comments.order(created_at: :desc).limit(5))
    end
  end

  describe "#increment_posts_counter" do
    it "should increment posts_counter" do
      expect(@post.author.posts_counter).to eq(0)
      @post.save
      expect(@post.author.posts_counter).to eq(1)
    end
  end
end