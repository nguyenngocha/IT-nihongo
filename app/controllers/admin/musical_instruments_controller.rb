class Admin::MusicalInstrumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :load_musical_instrument, only: [:edit, :update, :destroy, :show]

  def index
    @musical_instruments = MusicalInstrument.all
  end

  def new
    @musical_instrument = MusicalInstrument.new
    @musical_instrument.musical_instrument_images.build
    @musical_instrument.musical_instrument_sellers.build
  end

  def create
    @musical_instrument = MusicalInstrument.new musical_instrument_params
    if @musical_instrument.save
      flash[:success] = t "admin.flash.add_success",
        source: t("admin.musical_instrument.name")
      redirect_to admin_musical_instruments_path
    else
      render :new
    end
  end

  def update
    if @musical_instrument.update_attributes musical_instrument_params
      flash[:success] = t "admin.flash.edit_success", 
        source: t("admin.musical_instrument.name")
      redirect_to admin_musical_instruments_path
    else
      render :edit
    end
  end

  def destroy
    @musical_instrument.destroy
    flash[:success] = t "admin.flash.destroy_success",
      source: t("admin.musical_instrument.name")
    redirect_to admin_musical_instruments_path
  end

  private
  def musical_instrument_params
    params.require(:musical_instrument).permit :name, :price, :material,
      :brand, musical_instrument_images_attributes: [:id, :image, :_destroy],
      musical_instrument_sellers_attributes: [:id, :name, :_destroy]
  end

  def load_musical_instrument
    @musical_instrument = MusicalInstrument.find_by_id params[:id]
    if @musical_instrument.nil?
      flash[:danger] = t "admin.flash.not_found",
        source: t("admin.musical_instrument.name")
      redirect_to admin_musical_instruments_path
    end
  end
end
