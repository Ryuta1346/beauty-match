class SalonsController < ApplicationController
  before_action :set_salon, only: [:show]
  before_action :authenticate_salon!, only: [:show,:new]


  def index
    @salons = Salon.all
  end

  def show
    @reservations = @salon.salon_reservations.all
  end

  # def new
  #   @salon = Salon.new
  # end
  #
  # def create
  #   @salon = Salon.create(salon_params)
  #   if @salon.save
  #     flash[:success] = "サロン登録に成功しました"
  #     redirect_to root_url
  #   else
  #     flash[:danger] = "サロン登録に失敗しました"
  #     render 'new'
  #   end
  # end
  #
  # def edit
  # end
  #
  # def update
  #   if @salon.update_attributes(salon_params)
  #     flash[:success] = "サロン情報の更新に成功しました"
  #     redirect_to salon_url
  #   else
  #     flash[:danger] = "サロン情報の更新に失敗しました"
  #     render 'edit'
  #   end
  # end
  #
  # def destroy
  #   if @salon.destroy
  #     flash[:success] = "サロン情報を削除しました"
  #     redirect_to root_url
  #   else
  #     flash[:danger] = "サロン情報の削除に失敗しました"
  #     render 'show'
  #   end
  # end

  private

    # def salon_params
    #   params.require(:salon).permit(:category_id, :prefecture_id, :name, :place, :tel, :manage, :num_of_stylists, :num_of_sheets, :cut_price, :features)
    # end

    def set_salon
      @salon = Salon.find(params[:id])
    end
end
