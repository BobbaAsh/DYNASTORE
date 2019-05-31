class ArtistsController < ApplicationController
  before_action :authenticate_user!, :set_artist, only: [:show]
  skip_after_action :verify_authorized, only: :index_manager

  def index
    if params[:query].present?
      @artists = policy_scope(Artist).search_by_name_and_genre(params[:query]).order(created_at: :desc)
    else
      @artists = Artist.all
      @artists = policy_scope(Artist).order(created_at: :desc)
    end
  end

  def index_manager
    @artists = current_user.artists
  end

  def show
    authorize @artist
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

  def destroy
    @artist = Artist.find(params[:id])
    authorize @artist
    @artist.destroy
    redirect_to artists_path
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre, :price, :description, :photo)
  end
end
