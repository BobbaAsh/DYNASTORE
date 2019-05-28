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
  #   @reservation = Reservation.new
  #   if @reservation.save
  #     redirect_to reservation_path(@reservation)
  #   else
  #     render :new
  #   end
  end

  def update
  end

  def delete
  end

  def reservation_params
    params.require(:user_id).permit(:status)
end
