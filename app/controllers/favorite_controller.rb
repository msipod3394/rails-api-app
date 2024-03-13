class FavoriteController < ApplicationController
  def index
  end

  def show
    @favorites = Favorite.includes(:item, :user).all
    render json: @favorites, include: [:item, :user]
  end
end
