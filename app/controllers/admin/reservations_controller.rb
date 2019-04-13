class Admin::ReservationsController < Admin::Base
  before_action :authenticate_salon!

  FREE_SALON = 1

  def index
    salon_data    = current_salon.salon_reservations.where("book_time >= ?", DateTime.now).all
    @reservations = Reservation.where(salon_reservation_id: salon_data).all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes!(book_params)
      flash[:success] = "取引情報の更新に成功しました"
      redirect_to admin_salon_url
    else
      flash[:danger] = "取引情報の更新に失敗しました"
      render admin_salon_salon_reservations_path
    end
  end

  def history
    salon_data = current_salon.salon_reservations.all
    @stylists  = Reservation.where(salon_reservation_id: salon_data).all
  end

  private

    def book_params
      params.require(:reservation).permit(:user_id, :salon_reservation_id, :stylist_reservation_id, :menu_id, :finish_salon, :finish_stylist, :salon_memo, :stylist_memo)
    end
end
