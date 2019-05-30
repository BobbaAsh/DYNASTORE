class ArtistsController < ApplicationController
  before_action :authenticate_user!, :set_artist, only: [:show]
  def index
<<<<<<< HEAD
    if params[:query].present?
      @artists = Artist.where(name: params[:query])
    else
      @artists = Artist.all
    end
=======
    @artists = policy_scope(Artist).order(created_at: :desc)
    @artists = Artist.all
>>>>>>> ea20a0079e494dcd3446ff15dda4effb5d44eff5
  end

  def show
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
