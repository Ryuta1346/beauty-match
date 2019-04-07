class Admin::MenusController < Admin::Base
  before_action :authenticate_stylist!

  def index
    @menus = current_stylist.menus.all
  end

  def show
    @menu = current_stylist.menus.find(params[:id])
  end
end
