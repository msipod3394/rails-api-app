class UserController < ApplicationController
  def index
  end

  def show
    # 全てのusersをjsonで返す
    @users = User.all
    render json: @users
  end
end
