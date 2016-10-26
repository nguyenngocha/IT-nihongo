class StaticPagesController < ApplicationController
  def home
    @musical_instruments = MusicalInstrument.includes(:musical_instrument_images)
    @musical_instrument = MusicalInstrument.find_by_id params[:musical_instrument_id]
    @musical_instrument ||= MusicalInstrument.first
    @images = @musical_instrument.musical_instrument_images

    respond_to do |format|
      format.html
      format.js
    end
  end
end
