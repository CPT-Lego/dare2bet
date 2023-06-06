class BetsController < ApplicationController
  def index
    @bets = Bet.all
  end


  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    redirect_to bets_path(@bet), notice: "Bet was successfully cancelled."
  end

end
