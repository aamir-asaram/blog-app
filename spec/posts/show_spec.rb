require 'rails_helper'

RSpec.describe Post, type: :system do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @user2 = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'My post', text: 'This is my first post', author: @user)
    @comment = Comment.create(text: 'This is my first comment', author: @user2, post: @post)
    Like.create(author: @user2, post: @post)
  end

  describe 'Post Show Page' do
    before(:each) do
      visit user_post_path(@user.id, @post.id)
    end

    it 'displays the post title' do
      expect(page).to have_content('My post')
    end

    it 'displays post author' do
      expect(page).to have_content('by Tom')
    end

    it 'displays the correct number of comments' do
      expect(page).to have_content('Comments: 1')
    end

    it 'displays the correct number of likes' do
      expect(page).to have_content('Likes: 1')
    end

    it 'displays post text' do
      expect(page).to have_content('This is my first post')
    end

    it 'displays user name of the comment author' do
      expect(page).to have_content('John')
    end

    it 'displays comment text' do
      expect(page).to have_content('This is my first comment')
    end
  end
end
