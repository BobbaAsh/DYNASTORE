class ArtistsController < ApplicationController
  before_action :authenticate_user!, :set_artist, only: [:show]

  def index
    @artists = policy_scope(Artist).order(created_at: :desc)
    @artists = Artist.all
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @artist = Artist.new
    authorize @artist
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    authorize @artist
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    authorize @artist
    @artist.update(artist_params)
    redirect_to @artist
  end

  def edit
    @artist = Artist.find(params[:id])
    authorize @artist
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre, :price, :description, :photo)
  end
end
