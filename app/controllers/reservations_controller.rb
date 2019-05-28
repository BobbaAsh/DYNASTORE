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
  end

  def update
  end

  def delete
  end

  private

  def reservation_params
    params.require(:user).permit(:user_id)
  end
end
