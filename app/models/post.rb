class Post < ApplicationRecord
  belongs_to :musical_instrument
  belongs_to :user

  has_many :evaluation, dependent: :destroy
end
