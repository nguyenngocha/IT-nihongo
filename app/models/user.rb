class User < ApplicationRecord
  has_one :profile, dependent: :destroy

  has_many :post, dependent: :destroy
  has_many :evaluation, dependent: :destroy
  has_many :comment, dependent: :destroy
end
