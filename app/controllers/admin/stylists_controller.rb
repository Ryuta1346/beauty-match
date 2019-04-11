class Admin::StylistsController < Admin::Base
  before_action :authenticate_stylist!, except: [:index]
  before_action :authenticate_salon!, only: [:index]

  def index
    @stylists = current_salon.stylists.all
  end

  def member
    @salon    = Salon.find(params[:salon_id])
    @stylists = @salon.stylists.all
  end

  def show
    @stylist = current_stylist
    @stylist_reservations = current_stylist.stylist_reservations.all
    @books        = @stylist.reservation_management
  end

  def new
    @stylist = Stylist.new
  end

  def create
    @stylist = current_stylist.create(stylist_params)
    if @stylist.save
      flash[:success] = "スタイリストを登録しました"
      redirect_to stylist_url(@stylist)
    else
      flash[:danger] = "スタイリストの登録に失敗しました"
      render 'new'
    end
  end

  def edit
    @stylist = current_stylist
  end

  def update
    @stylist = current_stylist
    if @stylist.update_attributes!(stylist_params)
      flash[:success] = "スタイリスト情報を変更しました"
      sign_in(@stylist, bypass: true) if current_stylist.id == @stylist.id
      redirect_to admin_stylist_url
    else
      flash[:danger] = "スタイリスト情報の変更に失敗しました"
      render_to edit_admin_salon_stylist_path
    end
  end

  private

    def stylist_params
      params.require(:stylist).permit(:category_id, :salon_id, :name, :tel, :email, :stylist_since, :activity_scope, :cut_price, :features)
    end
end
