class ArtistsController < ApplicationController
  before_action :authenticate_user!, :set_artist, only: [:show]
  def index
    if params[:query].present?
      @artists = Artist.where(name: params[:query])
    else
      @artists = Artist.all
    end
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre, :price, :description, :photo)
  end
end
