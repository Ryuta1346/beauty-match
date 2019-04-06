class SalonReservationsController < ApplicationController
  before_action :authenticate_salon!
  before_action :set_salon, except: [:index, :new, :create, :books]
  # before_action :authenticate_salon!, only: [:show,:new]

  def index
    @salon = Salon.find(params[:salon_id])
    @reservations = @salon.salon_reservations.all
  end

  def books
    @books = SalonReservation.all
  end

  def show
    @salon = Salon.find(params[:salon_id])
    @salon_reservation = @salon.salon_reservations.find(params[:id])
  end

  def new
    @salon = current_salon
    @reservation = @salon.salon_reservations.new
  end

  def create
    @reservation = current_salon.salon_reservations.create!(salon_reservation_params)
    if @reservation.save
      flash[:success] = "登録に成功しました"
      redirect_to salon_salon_reservations_url(current_salon)
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
      @salon = Salon.find(params[:salon_id])
    end
end