class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :destroy, :update]

  def index
    @games = Game.all
    @groups = Group.all
    @game = Game.new

    @q = Game.search(params[:q])
    @games = @q.result(distinct: true)
  end

  def new
    @game = Game.new
  end

  def show
    @comments = @game.comments
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
    @group = Group.find(params[:group_id])
    @game = Game.find(params[:game][:id])

    if check_if_game_in_group?(@group, @game) == true
      flash[:info] = "#{@game.name} is already in #{@group.name}"
      redirect_to games_path
    elsif check_if_game_in_group?(@group, @game) == false
      @group.games << @game
      flash[:success] = "You have added #{@game.name} to #{@group.name}"
      redirect_to group_path(@group)
    end
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end
    
    def game_params
      params.require(:game).permit(:name, :description, :image)
    end
  
    def check_if_game_in_group?(group, game_to_add)
      game_in_group = false
  
      group.games.each do |game|
        if game.id == game_to_add.id
          game_in_group = true
        end
      end
      game_in_group
    end
end
