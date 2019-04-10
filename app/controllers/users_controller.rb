class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if current_user == User.find(params[:id])
      @user = current_user
    else
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "ユーザーの登録に成功しました"
      redirect_to 'show'
    else
      flash[:danger] = "ユーザーの登録に失敗しました"
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes!(user_params)
      flash[:success] = "ユーザー情報の更新に成功しました"
      redirect_to user_path
    else
      flash[:danger] = "ユーザー情報の更新に失敗しました"
      render edit_user_path
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "ユーザーを削除しました"
      redirect_to root_path
    else
      flash[:danger] = "ユーザーの削除に失敗しました"
      render 'show'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :tel, :email, :birth_year)
    end

    def set_user
      @user = User.find(params[:id])
    end
end