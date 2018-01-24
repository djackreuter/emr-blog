require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests' do
    it 'ensures commenter name presence' do
      comment = Comment.new(body: 'This is a test comment').save
      expect(comment).to eq(false)
    end

    it 'ensures comment body presence' do
      comment = Comment.new(commenter: 'Jimmy Hopkins').save
      expect(comment).to eq(false)
    end

    it 'should save successfully' do
      comment = Comment.new(commenter: 'Jimmy Hopkins', body: 'This is a test comment').save
      expect(comment).to eq(true)
    end
  end
end
