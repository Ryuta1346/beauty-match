class Admin::SalonsController < Admin::Base
  before_action :authenticate_salon!

  def show
    @salon = current_salon
    @reservations = @salon.salon_reservations.all
  end

  # def edit
  #   @salon = current_salon
  # end

  def update
    @salon = current_salon.salon_reservations
    if @salon.update_attributes!(salon_params)
      flash[:success] = "情報の更新に成功しました"
      redirect_to admin_salon_url
    else
      flash[:danger] = "情報の更新に失敗しました"
      render edit_admin_salon_path
    end
  end

  private

  def salon_params
    params.require(:salon).permit(:category_id, :salon_id, :prefecture_id, :name, :email, :password, :password_confirmation, :place, :manage, :tel, :features, :cut_price, :num_of_sheets, :num_of_stylists)
  end
end
