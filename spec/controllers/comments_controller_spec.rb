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
end
