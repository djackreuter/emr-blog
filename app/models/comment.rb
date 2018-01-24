class Comment < ApplicationRecord
  validates :body, presence: true, length: { minimum: 3 }
  validates :commenter, presence: true
  belongs_to :post
end
