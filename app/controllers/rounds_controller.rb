class RoundsController < ApplicationController
  def create
    game   = Game.find(params[:game_id])
    @round = game.rounds.build(round_params)

    if @round.save
      redirect_to game_round_path(game, @round)
    else
      # placeholder
      redirect_to root_url
    end
  end

  def show
    @round = Round.find(params[:id])
  end

  private

  def round_params
    params.require(:round).permit(:round_number)
  end
end
