class Admin::SalonsController < Admin::Base
  before_action :authenticate_salon!

  def show
    @salon        = current_salon
    @reservations = @salon.salon_reservations.all
    @books        = @salon.reservation_management(@salon)
  end

  def edit
    @salon = current_salon
  end

  def update
    @salon = current_salon
    if @salon.update_attributes!(salon_params)
      flash[:success] = "情報を変更しました"
      sign_in(@salon, bypass: true) if current_salon.id == @salon.id
      redirect_to admin_salon_url
    else
      flash[:danger] = "情報の変更に失敗しました"
      render_to edit_admin_salon_path
    end
  end

  private

    def salon_params
      params.require(:salon).permit(:category_id, :salon_id, :prefecture_id, :name, :email, :place, :manage, :tel, :features, :cut_price, :num_of_sheets, :num_of_stylists)
    end
end
