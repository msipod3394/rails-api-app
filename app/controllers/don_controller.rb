class DonController < ApplicationController
  def index
  end

  def show
    # 全てのdonをjsonで返す
    @dons = Don.all
    render json: @dons
  end
end
