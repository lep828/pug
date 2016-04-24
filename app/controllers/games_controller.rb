class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :destroy, :update]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:success] = "You have added #{@game.name}."
      redirect_to games_path
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    flash[:info] = "You have removed #{@game.name}"
    @game.destroy
    redirect_to games_path
  end

  def update
    if @game.update(game_params)
      flash[:success] = "You have edited #{@game.name}."
      redirect_to games_path
    else
      render "edit"
    end
  end

  def add
    @group = Group.find(params[:id])
    raise params.inspect
    @game = Game.find(:id)
    if @group.games.create!(game_params)
      flash[:success] = "You have added #{@game.name} to #{@group.name}"
      redirect_to group_path
    else
      flash[:info] = "Something went wrong try again."
      redirect_to games_path
    end
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :description, :image)
    end
end
