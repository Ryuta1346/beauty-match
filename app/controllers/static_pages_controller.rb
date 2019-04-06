class StaticPagesController < ApplicationController
  def top
    @salons = Salon.all
    @stylists = Stylist.all
  end

  def about
  end

  def help
  end

  def contact
  end
end
