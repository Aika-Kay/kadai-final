class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def show
    @user = User.find(params[:id])
    @places = @user.places.order(id: :desc).page(params[:page])
    @gones = @user.places.where(status: "Gone").count
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private
  
  def correct_user
    @user = current_user.users.find_by(id: params[:id])
    unless @user
      redirect_to root_url
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
