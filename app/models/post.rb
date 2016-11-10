class Post < ApplicationRecord
  belongs_to :musical_instrument
  belongs_to :user

  def comments
    Comment.pcomments self.id
  end

  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>"},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  enum sound_quality: [:verybad, :bad, :normal, :good, :verygood]
  enum felling: [:villainous, :great, :awesome]

  has_one :musical_instrument_evaluate, dependent: :destroy
  accepts_nested_attributes_for :musical_instrument_evaluate, allow_destroy: true
end
