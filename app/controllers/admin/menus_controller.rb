class Admin::MenusController < Admin::Base
  before_action :authenticate_stylist!

  def index
    @menus = current_stylist.menus.all
    @menu  = current_stylist.menus.new
  end

  def show
    @menu = current_stylist.menus.find(params[:id])
  end

  def create
    @menu = current_stylist.menus.build(menu_params)
    if @menu.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_stylist_menus_url
    else
      flash[:danger] = "登録に失敗しました"
      render admin_stylist_menus_path
    end
  end

  def edit
    @menu = current_stylist.menus.find(params[:id])
  end

  def update
    if current_stylist.menus.update_attributes(menu_params)
      flash[:success] = "登録に成功しました"
      redirect_to admin_stylist_menus_url
    else
      flash[:danger] = "登録に失敗しました"
      render admin_stylist_menus_path
    end
  end

  def destroy
    current_stylist.menus.delete
    flash[:success] = "予約可能時間の情報を削除しました"
    redirect_to admin_stylist_menus_url
  end

  private

    def menu_params
      params.require(:menu).permit(:menu_name, :menu_price, :operation_time, :content, :memo)
    end
end
