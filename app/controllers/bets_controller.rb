class BetsController < ApplicationController
  def index
    @bets = Bet.all
  end


  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.save
    redirect_to bet_path(@bet)
  end


  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    redirect_to bets_path(@bet), notice: "Bet was successfully cancelled."
  end

    private

  def bet_params
    params.require(:bet).permit(:stake, :location, :end_time, :privacy, :status, :tag_id, :outcome)
  end




end


