class Admin::StylistReservationsController < Admin::Base
  before_action :authenticate_stylist!

  def index
    @books       = current_stylist.stylist_reservations.all
    @reservation = current_stylist.stylist_reservations.build
  end

  def show
    @stylist_reservation = current_stylist.stylist_reservations.find(params[:id])
  end

  def create
    @reservation = current_stylist.stylist_reservations.create(stylist_reservation_params)
    if @reservation.save
      flash[:success] = "予約可能時間を追加しました"
      redirect_to admin_stylist_stylist_reservations_url
    else
      flash[:danger] = "予約可能時間の登録に失敗しました"
      redirect_to admin_stylist_stylist_reservations_url
    end
  end

  def edit
    @stylist_reservation = current_stylist.stylist_reservations.find(params[:id])
  end

  def update
    @stylist_reservation = current_stylist.stylist_reservations.find(params[:id])
    if @stylist_reservation.update_attributes!(stylist_reservation_params)
      flash[:success] = "予約可能時間情報の変更をしました"
      redirect_to admin_stylist_stylist_reservations_url
    else
      flash[:danger] = "予約可能時間情報の変更に失敗しました"
      render edit_admin_stylist_stylist_reservation_path
    end
  end

  def destroy
    @stylist_reservation = current_stylist.stylist_reservations.find(params[:id])
    if @stylist_reservation.destroy
      flash[:success] = "予約可能時間#{@stylist_reservation.book_time.strftime('%Y年%m月%d日 %H:%M')}の情報を削除しました"
      redirect_to admin_stylist_stylist_reservations_url
    else
      flash[:danger] = "予約可能時間の情報の削除に失敗しました"
      render edit_admin_stylist_stylist_reservation_path
    end
  end

  private

    def stylist_reservation_params
      params.require(:stylist_reservation).permit(:menu_id, :book_time, :operation_time, :memo)
    end
end
