class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { minimum: 10 }
  validates_presence_of :user
end
