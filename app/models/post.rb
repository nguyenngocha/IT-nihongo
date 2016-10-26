class Post < ApplicationRecord
  belongs_to :musical_instrument
  belongs_to :user

  has_many :evaluation, dependent: :destroy

  enum sound_quality: [:verybad, :bad, :normal, :good, :verygood]
  enum felling: [:villainous, :great, :awesome]
end
