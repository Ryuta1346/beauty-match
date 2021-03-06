class ReservationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @salons              = Salon.where.not(id: FREE_SALON).all
    @stylists            = Stylist.all
    @reservation         = Reservation.new
    @salon_reservation   = SalonReservation.where.not(salon_id: FREE_SALON).where("book_time >= ?", DateTime.now).all
    @stylist_reservation = StylistReservation.where("book_time >= ?", DateTime.now).all
  end

  def show
    if current_user == Reservation.find(params[:id]).user
      @reservation = current_user.reservations.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def create
    @reservation = current_user.reservations.build(book_params)
    if @reservation.book_time_management
      @reservation.save
      flash[:success] = "予約登録に成功しました"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "予約登録に失敗しました"
      redirect_to request.referrer || root_path
    end
  end

  def destroy
    @reservation = current_user.reservations.find(params[:id])
    if @reservation.destroy
      flash[:success] = "予約をキャンセルしました"
      redirect_to root_url
    end
  end

  private

    def book_params
      params.require(:reservation).permit(:user_id, :salon_reservation_id, :stylist_reservation_id, :menu_id)
    end

    FREE_SALON = 1
end
