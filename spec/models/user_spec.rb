require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name is present' do
      user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password').save
      expect(user).to eq(false)
    end

    it 'ensures user is created successfully' do
      user = User.new(name: 'Jimmy Hopkins', email: 'test@test.com', password: 'password', password_confirmation: 'password').save
      expect(user).to eq(true)
    end
  end
end
