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
    if @bet.save
      BetMember.create(bet: @bet, user: current_user)
      redirect_to bets_path(@bet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    if request.referrer == my_bets_url
      redirect_to my_bets_path, notice: "Bet was successfully cancelled."
    else
      redirect_to bets_path, notice: "Bet was successfully cancelled."
    end
  
  end

  def my_bets
    @bets = current_user.bets
    #@bets = Bet.where(user_id: current_user.id)
  end

  private

  def bet_params
    params.require(:bet).permit(:name, :stake, :location, :end_time, :privacy, :status, :tag_id, :outcome, user_ids:[])
  end

end
