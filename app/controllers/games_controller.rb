class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(@game_params)

    if @game.save
      redirect_to @game
    else
      # errors
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:win_threshold)
  end
end
