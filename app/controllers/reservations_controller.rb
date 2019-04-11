class ReservationsController < ApplicationController
  def index
    @salons   = Salon.all
    @stylists = Stylist.all
    @reservation          = current_user.reservations.new if user_signed_in?
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
  end

  def new
    @reservation = Reservation.new
  end

  def create
    # SalonReservationとStylistReservationのbook_timeのどちらも同じ場合のみcreateを成功させる
    @reservation = current_user.reservations.new(book_params)
    if @reservation.salon_reservation.book_time == @reservation.stylist_reservation.book_time
      @reservation.save
      flash[:success] = "予約登録に成功しました"
      redirect_to root_url
    else
      flash[:danger] = "予約登録に失敗しました"
      redirect_to request.referrer || root_path
    end
  end

  private

    def book_params
      params.require(:reservation).permit(:user_id, :salon_reservation_id, :stylist_reservation_id)
    end
end
