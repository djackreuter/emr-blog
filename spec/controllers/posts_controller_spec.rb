require 'rails_helper'
require 'faker'

RSpec.describe PostsController, type: :controller do
  let(:user) do
    user = User.new(name: 'Johnny Vincint', email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
    user.save(validate: false)
    sign_in user
  end

  let(:new_post) do
    post = Post.new(title: 'Test title', body: 'test post body', user_id: 1)
    post.save(validate: false)
    post
  end

  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end
  end

  context 'GET #show' do
    it 'returns a success response' do
      new_post
      get :show, params: { id: new_post.id }
      expect(response).to be_success
    end
  end

  context 'GET #new' do
    it 'returns a success response' do
      new_post
      expect(response).to be_success
    end
  end

  context 'GET #edit' do
    it 'returns a success response' do
      new_post
      user
      get :edit, params: { id: new_post.id }
      expect(response).to be_success
    end
  end

  context 'POST #create' do
    it 'redirects to root path' do
      new_post
      user
      post :create, params: { post: { title: new_post.title, body: new_post.body } }
      expect(response).to redirect_to(root_path)
    end
  end

  context 'PATCH #update' do
    it 'redirects to post_path' do
      user
      new_post
      patch :update, params: { id: new_post.id, post: { title: 'updated post title', body: 'updated post body' } }
      expect(response).to redirect_to("/posts/#{new_post.id}")
    end
  end

  context 'DELETE #destroy' do
    it 'redirects to root_path' do
      user
      new_post
      delete :destroy, params: { id: new_post.id }
      expect(response).to redirect_to(root_path)
    end
  end
end
