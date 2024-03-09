class NetaController < ApplicationController
  def index
  end

  def show
    # 全てのnetaをjsonで返す
    @netas = Neta.all
    render json: @netas
  end
end
