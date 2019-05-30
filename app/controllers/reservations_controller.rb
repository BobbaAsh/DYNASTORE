class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.artist = @artist

    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to @reservation
  end

  def delete
    @reservation.destroy
    redirect_to reservation_url, notice: 'Your reservation was successfully destroyed !'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:begin_date, :end_date)
  end
end
