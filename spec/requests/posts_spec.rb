require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET users/:user_id/posts' do
    before :each do
      @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @post = Post.create(title: 'My post', text: 'This is my first post', author: @user)
      get user_posts_path(@user.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET users/:user_id/posts/:id' do
    before :each do
      @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @post = Post.create(title: 'My post', text: 'This is my first post', author: @user)
      get user_post_path(@user.id, @post.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end
end
