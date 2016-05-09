class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
  end

  private

  def game_params
    params.require(:game).permit(:win_threshold, :current_round)
  end
end
