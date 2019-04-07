class SalonsController < ApplicationController
  before_action :set_salon, only: [:show, :destroy]

  def index
    @salons = Salon.all
  end

  def show
    @reservations = @salon.salon_reservations.all
  end

  def destroy
  end

  private

    def set_salon
      @salon = Salon.find(params[:id])
    end
end
