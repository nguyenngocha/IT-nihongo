class AddAttachmentImageToMusicalInstrumentImages < ActiveRecord::Migration
  def self.up
    change_table :musical_instrument_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :musical_instrument_images, :image
  end
end
