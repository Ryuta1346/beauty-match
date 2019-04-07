class Admin::SalonReservationsController < Admin::Base
  before_action :authenticate_salon!

  def index
    @books       = current_salon.salon_reservations.all
    @reservation = current_salon.salon_reservations.build
  end


  def show
    @book = current_salon.salon_reservations.find(params[:id])
  end

  def new
    @salon_reservation = current_salon.salon_reservations.new
  end

  def create
    @reservation = current_salon.salon_reservations.build(salon_reservation_params)
    if @reservation.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_salon_salon_reservations_url
    else
      flash[:danger] = "登録に失敗しました"
      render admin_salon_salon_reservations_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

    def salon_reservation_params
      params.require(:salon_reservation).permit(:book_time)
    end
end
