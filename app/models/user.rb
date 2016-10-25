class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true

  has_many :post, dependent: :destroy
  has_many :evaluation, dependent: :destroy
  has_many :comment, dependent: :destroy

  validates :name, presence: true

  enum gender: [:male, :female]
  enum role: [:user, :admin]

  def password_required?
    new_record? ? super : false
  end
end
