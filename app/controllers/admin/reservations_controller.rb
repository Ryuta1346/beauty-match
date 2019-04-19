class Admin::ReservationsController < Admin::Base
  before_action :authenticate_salon!, except: [:books]
  before_action :authenticate_stylist!, only: [:books]

  def index
    salon_data    = current_salon.salon_reservations.where("book_time >= ?", DateTime.now).ids
    @reservations = Reservation.where(salon_reservation_id: salon_data).where(finish_salon: false).all
  end

  def books
    stylist_data  = current_stylist.stylist_reservations.where("book_time >= ?", DateTime.now).ids
    @reservations = Reservation.where(stylist_reservation_id: stylist_data).all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def sales
    salon_data = current_salon.salon_reservations.ids
    @sales     = Reservation.where(salon_reservation_id: salon_data).where(finish_salon: true).all
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes!(book_params)
      flash[:success] = "取引情報の更新に成功しました"
      redirect_to admin_salon_reservation_url
    else
      flash[:danger] = "取引情報の更新に失敗しました"
      render admin_salon_reservation_path
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      flash[:success] = "予約情報を削除しました"
      redirect_to admin_salon_path
    else
      flash[:danger] = "予約情報の削除に失敗しました"
      render admin_salon_reservations_path
    end
  end

  def history
    salon_data = current_salon.salon_reservations.ids
    @stylists  = Reservation.where(salon_reservation_id: salon_data).all
  end

  private

    def book_params
      params.require(:reservation).permit(:user_id,
                                          :salon_reservation_id,
                                          :stylist_reservation_id,
                                          :menu_id, :finish_salon,
                                          :finish_stylist,
                                          :salon_memo,
                                          :stylist_memo)
    end

    FREE_SALON = 1
end
