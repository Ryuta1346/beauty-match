class SalonsController < ApplicationController
  def index
    @salons = Salon.all
  end

  def show
    @salon = Salon.find(params[:id])
  end

  def new
    @salon = Salon.new
  end

  def create
    @salon = Salon.create(salon_params)
    if @salon.save
      flash[:success] = "サロン登録に成功しました"
      redirect_to root_url
    else
      flash[:danger] = "サロン登録に失敗しました"
      render 'new'
    end
  end

  def edit
    @salon = Salon.find(params[:id])
  end

  def update
    @salon = Salon.find(params[:id])
    if @salon.update_attributes(salon_params)
      flash[:success]= "サロン情報の更新に成功しました"
      redirect_to salon_url
    else
      flash[:danger] = "サロン情報の更新に失敗しました"
      render salon_path
    end
  end

  def destroy

  end

  private

  def salon_params
    params.require(:salon).permit(:category_id, :prefecture_id, :name, :place, :tel, :manage, :num_of_stylists, :num_of_sheets, :cut_price, :features)
  end
end
