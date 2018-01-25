require 'rails_helper'
require 'faker'

RSpec.describe PostsController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end
  end

  context 'GET #show' do
    it 'returns a success response' do
      post = Post.new(title: 'Test title', body: 'test post body', user_id: 1)
      post.save(validate: false)
      get :show, params: { id: post.id }
      expect(response).to be_success
    end
  end

  context 'GET #new' do
    it 'returns a success response' do
      post = Post.new
      post.save(validate: false)
      expect(response).to be_success
    end
  end

  context 'GET #edit' do
    it 'returns a success response' do
      user = User.new(name: 'Johnny Vincint', email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
      user.save(validate: false)
      sign_in user
      post = Post.new(title: 'Test title', body: 'test post body', user_id: 1)
      post.save(validate: false)
      get :edit, params: { id: post.id }
      expect(response).to be_success
    end
  end
end
