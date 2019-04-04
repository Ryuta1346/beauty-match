class SalonReservationsController < ApplicationController
  before_action :set_salon, except: [:index, :new]

  def index
  end

  def show
  end

  def new
    @salon_reservation = @salon.salon_reservations.new
  end

  def create
    @salon_reservation = @salon.salon_reservations.create!(salon_reservation_params)
    if @salon_reservation.save
      flash[:success] = "登録に成功しました"
      redirect_to 'show'
    else
      flash[:danger] = "登録に失敗しました"
      render 'new'
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
      params.require(:salon_reservation).permit(:prefecture_id, :book_time)
    end

    def set_salon
      @salon = Salon.find(params[:id])
    end
end
