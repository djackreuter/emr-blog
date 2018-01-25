require 'rails_helper'
require 'faker'

RSpec.describe CommentsController, type: :controller do
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

  let(:comment) do
    comment = Comment.new(commenter: 'Ted Thompson', body: 'test comment')
    comment.save(validate: false)
    comment
  end

  let(:comment_with_post) do
    new_post
    comment_with_post = Comment.new(commenter: 'Ted Thompson', body: 'test comment', post: new_post)
    comment_with_post.save(validate: false)
    comment_with_post
  end

  context 'POST #create' do
    it 'returns redirects to post path' do
      new_post
      comment
      post :create, params: { post_id: new_post.id, comment: { commenter: comment.commenter, body: comment.body } }
      expect(response).to redirect_to post_path(id: new_post.id)
    end
  end

  context 'DELETE #destroy' do
    it 'redirects to post path' do
      user
      comment_with_post
      delete :destroy, params: { post_id: comment_with_post.post.id, id: comment_with_post.id }
      expect(response).to redirect_to post_path(id: new_post.id)
    end
  end
end
