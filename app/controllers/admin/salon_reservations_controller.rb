class Admin::SalonReservationsController < Admin::Base
  before_action :authenticate_salon!

  def index
    @books       = current_salon.salon_reservations.where("book_time > ?", DateTime.now).all
    @reservation = current_salon.salon_reservations.build
  end


  def show
    @book = current_salon.salon_reservations.find(params[:id])
  end

  def new
    @salon_reservation = current_salon.salon_reservations.new
  end

  def create
    # 現在時刻より前の時間は登録できないようにする
    @reservation = current_salon.salon_reservations.create(salon_reservation_params)
    if @reservation.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_salon_salon_reservations_url
    else
      flash[:danger] = "登録に失敗しました"
      render admin_salon_salon_reservations_path
    end
  end

  def edit
    @book = current_salon.salon_reservations.find(params[:id])
  end

  def update
    @book = current_salon.salon_reservations.find(params[:id])
    if @book.update_attributes!(salon_reservation_params)
      flash[:success] = "情報を変更しました"
      redirect_to admin_salon_salon_reservations_url
    else
      flash[:danger] = "情報の変更に失敗しました"
      render_to edit_admin_salon_path
    end
  end

  def destroy
    @book = current_salon.salon_reservations.find(params[:id])
    @book.delete
    flash[:success] = "予約可能時間情報を削除しました"
    redirect_to admin_salon_salon_reservations_url
  end

  private

    def salon_reservation_params
      params.require(:salon_reservation).permit(:book_time)
    end
end
