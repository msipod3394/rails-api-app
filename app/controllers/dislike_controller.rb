class DislikeController < ApplicationController
  def index
  end

  def show
    @dislikes = Dislike.includes(:ingredient, :user).all
    render json: @dislikes, include: [:ingredient, :user]
  end
end
