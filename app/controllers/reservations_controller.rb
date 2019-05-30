class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
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
    params.require(:user).permit(:user_id, :begin_date, :end_date, :status)
  end
end
