class Admin::StylistReservationsController < Admin::Base
  before_action :authenticate_stylist!

  def index
    @books = current_stylist.stylist_reservations.all
  end

  def show
    @stylist_reservation = current_stylist.stylist_reservations.find(params[:id])
  end
end
