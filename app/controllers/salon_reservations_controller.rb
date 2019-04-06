class SalonReservationsController < ApplicationController
  before_action :set_salon, except: [:books]

  def index
    @reservations = @salon.salon_reservations.all
  end

  def books
    @books = SalonReservation.all
  end

  def show
    @salon_reservation = @salon.salon_reservations.find(params[:id])
  end

  private

    def salon_reservation_params
      params.require(:salon_reservation).permit(:prefecture_id, :book_time)
    end

    def set_salon
      @salon = Salon.find(params[:salon_id])
    end
end
