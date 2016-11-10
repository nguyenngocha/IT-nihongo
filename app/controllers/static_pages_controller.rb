class StaticPagesController < ApplicationController
  def home
    @musical_instruments = MusicalInstrument.includes(:musical_instrument_images)
    @musical_instrument = MusicalInstrument.find_by_id params[:musical_instrument_id]
    @musical_instrument ||= MusicalInstrument.first

    @posts = @musical_instrument.posts
    @posts = Post.ransack(name_cont: params[:q]).result if params[:q]

    @is_search = false
    @is_search = true if params[:q]

    respond_to do |format|
      format.html
      format.js
    end
  end
end
