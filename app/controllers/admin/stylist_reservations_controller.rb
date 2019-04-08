class Admin::StylistReservationsController < Admin::Base
  before_action :authenticate_stylist!

  def index
    @books = current_stylist.stylist_reservations.all
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
    @reservation = current_stylist.stylist_reservations.find(params[:id])
  end

  def update

  end

  private

  def stylist_reservation_params
    params.require(:stylist_reservation).permit(:menu_id, :book_time, :operation_time, :memo)
  end
end
