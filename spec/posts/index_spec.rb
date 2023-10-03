require 'rails_helper'

RSpec.describe Post, type: :system do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'My post', text: 'This is my first post', author: @user)
    @post2 = Post.create(title: 'My post 2.0', text: 'This is my second post', author: @user)
    @comment = Comment.create(text: 'This is my first comment', author: @user, post: @post)
    Like.create(author: @user, post: @post)
  end

  describe 'Post Index Page' do
    before(:each) do
      visit user_posts_path(@user.id)
    end

    it 'displays the user image' do
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'displays the user name' do
      expect(page).to have_content('Tom')
    end

    it 'displays the correct number of posts' do
      expect(page).to have_content('Posts: 2')
    end

    it 'displays the post title' do
      expect(page).to have_content('My post')
    end

    it 'displays the post text' do
      expect(page).to have_content('This is my first post')
    end

    it 'displays the first comments' do
      expect(page).to have_content('This is my first comment')
    end

    it 'displays the number of comments' do
      expect(page).to have_content('Comments: 1')
    end

    it 'displays the number of likes' do
      expect(page).to have_content('Likes: 1')
    end

    it 'clicking on the post title should take you to the post show page' do
      click_on('My post 2.0')
      expect(page).to have_content('My post 2.0')
    end

    it 'should not render pagination if there are less than 3 posts' do
      expect(page).to_not have_content('Pagination')
    end

    it 'should render pagination if there are more than 3 posts' do
      @post3 = Post.create(title: 'My post 3.0', text: 'This is my third post', author: @user)
      @post4 = Post.create(title: 'My post 4.0', text: 'This is my fourth post', author: @user)
      @post5 = Post.create(title: 'My post 5.0', text: 'This is my fifth post', author: @user)
      visit user_posts_path(@user.id)
      expect(page).to have_content('Pagination')
    end
  end
end
