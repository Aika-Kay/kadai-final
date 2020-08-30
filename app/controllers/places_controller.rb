class PlacesController < ApplicationController

  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :destroy, :gone, :notgone]
  
  def index
    @places = current_user.places
  end
  
  def show
    correct_user
  end
  
  def new
    @place = Place.new
  end
  
  def create
    @place = current_user.places.build(place_params)
    
    if @place.save
      flash[:success] = '行きたい場所を追加しました。'
      redirect_to user_path(current_user)
    else
      
      flash.now[:danger] = '行きたい場所の追加に失敗しました。'
      render :new
    end
  end

  def destroy
    correct_user
    @place.destroy
    
    flash[:success] = '行きたい場所を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def gones
    correct_user
    if @place.status == nil
      @place.update(status: "Gone")
      @places = Place.all.includes(:user)
      flash[:success] = '行った場所に変更しました'
    else
      flash[:info] = 'すでに行った場所に変更してます'
    end
    redirect_back(fallback_location: root_path)
  end

  
  private
  
  def place_params
    params.require(:place).permit(:place, :reason)
  end
  
  def correct_user
    @place = current_user.places.find_by(id: params[:id])
    unless @place
      redirect_to root_url
    end
  end
  
  
end

