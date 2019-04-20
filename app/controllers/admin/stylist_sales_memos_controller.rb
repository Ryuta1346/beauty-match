class Admin::StylistSalesMemosController < Admin::Base
  before_action :authenticate_stylist!

  # スタイリストの予約管理の一覧ページ
  # get '/reservations'
  def index
    stylist_data  = current_stylist.stylist_reservations.where("book_time >= ?", DateTime.now).ids
    @reservations = Reservation.where(stylist_reservation_id: stylist_data).where(finish_stylist: false).all
  end

  # スタイリストの取引管理一覧ページ
  # get '/sales'
  def sales
    stylist_data = current_stylist.stylist_reservations.ids
    @sales       = Reservation.where(stylist_reservation_id: stylist_data).where(finish_stylist: true).all
  end

  def show
    @sale = Reservation.find(params[:id])
  end

  def update
    @sale = Reservation.find(params[:id])
    if @sale.update_attributes(sales_params)
      flash[:success] = "取引情報の更新に成功しました"
      redirect_to admin_stylist_stylist_sales_memo_url
    else
      flash[:danger] = "取引情報の更新に失敗しました"
      render admin_stylist_stylist_sales_memo_path
    end
  end

  private

    def sales_params
      params.require(:reservation).permit(:finish_stylist, :stylist_memo)
    end
end
