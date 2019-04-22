class Admin::ReservationsController < Admin::Base
  before_action :authenticate_salon!, except: [:index_for_stylist, :sales_for_stylist, :update_for_stylist, :show_for_stylist, :edit_for_stylist, :destroy_for_stylist]
  before_action :authenticate_stylist!, only: [:index_for_stylist, :sales_for_stylist, :update_for_stylist, :show_for_stylist, :edit_for_stylist, :destroy_for_stylist]

  # サロンの予約管理
  def index
    salon_data    = current_salon.salon_reservations.where("book_time >= ?", DateTime.now).ids
    @reservations = Reservation.where(salon_reservation_id: salon_data).where(finish_salon: false).all
  end

  # サロンの予約詳細
  def show
    @reservation = Reservation.find(params[:id])
  end

  # サロンの取引管理
  def sales
    salon_data = current_salon.salon_reservations.ids
    @sales     = Reservation.where(salon_reservation_id: salon_data).where(finish_salon: true).all
  end

  # サロンの取引情報更新
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # サロンの取引情報更新
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

  # サロンの予約情報の削除
  def destroy
    @reservation = Reservation.find(params[:id]).where_not(finish_salon: false)
    if @reservation.destroy
      flash[:success] = "予約情報を削除しました"
      redirect_to admin_salon_path
    else
      flash[:danger] = "予約情報の削除に失敗しました"
      render admin_salon_reservations_path
    end
  end

  # サロンの取引スタイリスト管理=>別コントローラへ切り出し
  def history
    salon_data = current_salon.salon_reservations.ids
    @stylists  = Reservation.where(salon_reservation_id: salon_data).all
  end

  # スタイリストの予約管理の一覧ページ
  # get '/reservations'
  def index_for_stylist
    stylist_data  = current_stylist.stylist_reservations.where("book_time >= ?", DateTime.now).ids
    @reservations = Reservation.where(stylist_reservation_id: stylist_data).where(finish_stylist: false).all
  end

  # スタイリストの取引管理一覧ページ
  # get '/sales'
  def sales_for_stylist
    stylist_data = current_stylist.stylist_reservations.ids
    @sales       = Reservation.where(stylist_reservation_id: stylist_data).where(finish_stylist: true).all
  end

  # スタイリストの個別予約情報
  # get 'reservations/:id'
  def show_for_stylist
    @reservation = Reservation.find(params[:id])
  end

  # スタイリストの個別予約情報の編集
  # get 'reservations/:id/edit'
  def edit_for_stylist
    @reservation = Reservation.find(params[:id])
  end

  # スタイリストのデータ更新用Update
  def update_for_stylist
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(book_params)
      flash[:success] = "取引情報の更新に成功しました"
      redirect_to reservation_admin_stylist_url
    else
      flash[:danger] = "取引情報の更新に失敗しました"
      render reservation_admin_stylist_path
    end
  end

  # スタイリストの個別予約管理削除
  def destroy_for_stylist
    @reservation = Reservation.find(params[:id]).where_not(finish_stylist: false)
    if @reservation.destroy
      flash[:success] = "予約情報を削除しました"
      redirect_to reservations_admin_stylist_url
    else
      flash[:danger] = "予約情報の削除に失敗しました"
      render reservation_admin_stylist_path
    end
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
