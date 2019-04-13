class StylistReservationsController < ApplicationController
  before_action :set_stylist

  def index
    @books = StylistReservation.all
  end

  def show
    @stylist_reservation = @stylist.stylist_reservations.find(params[:id])
    if user_signed_in?
      @reservation = current_user.reservations.new
    else
      redirect_to new_user_session_url
    end
  end

  private
    def set_stylist
      @stylist = Stylist.find(params[:stylist_id])
    end
end
