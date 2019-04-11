class StaticPagesController < ApplicationController
  FOR_TOP_PAGE = 4

  def top
    @salons = Salon.all
    @stylists = Stylist.all.limit(FOR_TOP_PAGE)
    if user_signed_in?
      @user = current_user
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end
