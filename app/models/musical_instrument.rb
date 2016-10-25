class MusicalInstrument < ApplicationRecord
  has_many :musical_instrument_images, dependent: :destroy
  accepts_nested_attributes_for :musical_instrument_images,
    reject_if: proc {|attributes| attributes["_destroy"] == "1"}

  has_many :musical_instrument_sellers, dependent: :destroy
  accepts_nested_attributes_for :musical_instrument_sellers,
    reject_if: proc {|attributes| attributes["_destroy"] == "1"}

  validates :name, presence: true
  validates :price, presence: true
  validates :material, presence: true
  validates :brand, presence: true
end
