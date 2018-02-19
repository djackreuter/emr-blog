class User < ApplicationRecord
  after_create :register_with_authy
  has_many :posts, dependent: :destroy, inverse_of: :user
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  accepts_nested_attributes_for :posts, allow_destroy: true, reject_if: proc { |attr| attr['title'].blank? || attr['body'].blank? }

  def register_with_authy
    authy = Authy::API.register_user(
      email: self.email,
      phone_number: self.phone_number,
      country_code: '1'
      )
    if authy.ok?
      self.update_column(:authy_id, authy.id)
    else
      authy.errors
    end
  end
end
