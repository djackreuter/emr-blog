class User < ApplicationRecord
  has_many :posts, dependent: :destroy, inverse_of: :user
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  accepts_nested_attributes_for :posts, allow_destroy: true, reject_if: proc { |attr| attr['title'].blank? || attr['body'].blank? }
end
