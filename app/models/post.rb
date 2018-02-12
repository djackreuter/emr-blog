class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { minimum: 10 }
  validates_presence_of :user
  has_attached_file :post_image, styles: { post_show: '652x393>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\z/
end
