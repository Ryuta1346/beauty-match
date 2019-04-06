class Admin::SalonsController < Admin::Base
  before_action :authenticate_salon!

  def show
    @salon = current_salon
    @reservations = @salon.salon_reservations.all
  end

  def edit
    @salon = current_salon
  end

  def update
    @salon = current_salon.update_attributes
    if @salon.save
      flash[:success] = "情報の更新に成功しました"
      redirect_to admin_salon_url
    else
      flash[:danger] = "情報の更新に失敗しました"
      render edit_admin_salon_path
    end
  end
end
