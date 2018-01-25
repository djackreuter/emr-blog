require 'rails_helper'
require 'faker'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    it 'ensures title presence' do
      post = Post.new(body: 'this is a test body').save
      expect(post).to eq(false)
    end

    it 'ensures body presence' do
      post = Post.new(title: 'this is a text title').save
      expect(post).to eq(false)
    end

    it 'ensures min title length is met' do
      post = Post.new(title: 'te', body: 'this is a test body').save
      expect(post).to eq(false)
    end

    it 'ensures min body length is met' do
      post = Post.new(title: 'this is a test title', body: 'this is').save
      expect(post).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(name: 'Bif Taylor', email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
      user.save(validate: false)
      post = Post.new(title: 'this is a test title', body: 'this is a test body', user: user).save
      expect(post).to eq(true)
    end
  end
end
