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
<<<<<<< HEAD
    @reservation = Reservation.new(reservation_params)
=======
    @reservation = Reservation.new
>>>>>>> e4784dfb06dd57ca94961186299b175800f560c0
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      render :new
    end
<<<<<<< HEAD
  end

  def edit
=======
>>>>>>> e4784dfb06dd57ca94961186299b175800f560c0
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
end
