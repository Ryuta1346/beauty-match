class StylistReservationsController < ApplicationController
  def index
    @books = StylistReservation.all
  end

  def show
    @stylist_reservation = StylistReservation.find(params[:id])
  end
end
