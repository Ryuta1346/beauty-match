class SalonsController < ApplicationController
  before_action :set_salon, only: [:show, :destroy]

  def index
    @salons = Salon.all
  end

  def show
    @reservations = @salon.salon_reservations.all
  end

  def create
    @reservation = current_user.reservations.build(book_params)
    if @reservation.save
      flash[:success] = "予約しました"
      redirect_to root_path
    else
      flash[:danger] = "予約に失敗しました"
      redirect_to edit_salon_path
    end
  end

  def destroy
  end

  private

    def book_params
      params.require(:salon).permit(:salon_reservation_id, :stylist_reservation_id, :menu_id)
    end

    def set_salon
      @salon = Salon.find(params[:id])
    end
end
