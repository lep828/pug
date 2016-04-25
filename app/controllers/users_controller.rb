class UsersController < ApplicationController

  def index
    @users = User.all

    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
  end
end
