class StaticPagesController < ApplicationController
  def home
    @is_search = false
    @is_search = true if params[:q]

    if @is_search
      @posts = Post.where musical_instrument_id: params[:selected]
      @posts = @posts.ransack(name_cont: params[:q]).result
    else
      @musical_instruments = MusicalInstrument.includes(:musical_instrument_images)
      @musical_instrument = MusicalInstrument.find_by_id params[:musical_instrument_id]
      @musical_instrument ||= MusicalInstrument.first
      @posts = @musical_instrument.posts
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
