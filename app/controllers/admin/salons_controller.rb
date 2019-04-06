class Admin::SalonsController < Admin::Base
  before_action :set_salon, only: [:show]
  before_action :authenticate_salon!, only: [:show, :new, :books]

  def index
    @salons = Salon.all
  end

  def show
    if current_salon == Salon.find(params[:id])
      @reservations = @salon.salon_reservations.all
    else
      redirect_to root_url
    end
  end

  # def books
  #   @books = current_salon.salon_reservations.all
  #   @book  = current_salon.salon_reservations.find(params[:salon_id])
  # end

  private

    def set_salon
      @salon = Salon.find(params[:id])
    end
end
