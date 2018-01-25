require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name is present' do
      user = User.new(email: Faker::Internet.email, password: 'password', password_confirmation: 'password').save
      expect(user).to eq(false)
    end

    it 'ensures user is created successfully' do
      user = User.new(name: 'Jimmy Hopkins', email: Faker::Internet.email, password: 'password', password_confirmation: 'password').save
      expect(user).to eq(true)
    end
  end
end
