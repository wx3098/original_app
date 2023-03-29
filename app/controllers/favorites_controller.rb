class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.create(hospital_id: params[:hospital_id])
    if @favorite.save
      flash[:notice] = 'お気に入りに追加しました'
    else
      flash[:alert] = 'お気に入りに追加できませんでした'
    end
    redirect_to tops_path
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @favorite.destroy
    flash[:notice] = 'お気に入りから解除しました'
    redirect_to tops_path
  end
end
