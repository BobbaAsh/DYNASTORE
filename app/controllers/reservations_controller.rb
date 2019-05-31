class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = policy_scope(Reservation).order(created_at: :desc)
    @reservations = current_user.reservations
  end

  def index_manager
    @reservations = current_user.manager_reservations
    authorize @reservations.first
  end

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def show
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @reservation = current_user.reservations.build(reservation_params)
    authorize @reservation
    @reservation.artist = @artist

    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def update
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.update(reservation_params)
    redirect_to @reservation
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.destroy
    redirect_to reservations_path, notice: 'Your reservation was successfully destroyed !'
  end


  private

  def reservation_params
    params.require(:reservation).permit(:begin_date, :end_date)
  end

end
