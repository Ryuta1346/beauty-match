class StylistReservationsController < ApplicationController
  before_action :set_stylist

  def index
    @books = StylistReservation.all
  end

  def show
    @stylist_reservation = @stylist.stylist_reservations.find(params[:id])
    @reservation = current_user.reservations.new
  end

  private
    def set_stylist
      @stylist = Stylist.find(params[:stylist_id])
    end
end
