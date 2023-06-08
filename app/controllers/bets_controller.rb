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

  def edit
  end

  def resolve
    @bet = Bet.find(params[:bet_id])
    @bet_member = BetMember.find_by(bet: @bet, user: current_user)
  end

  def set_result
    @bet = Bet.find(params[:bet_id])
    @bet_member = BetMember.find_by(bet: @bet, user: current_user)
    first_outcome = params[:bet_member][:outcome]
    @bet_member.outcome = first_outcome
    @bet_member.save
    @other_bet_member = @bet.bet_members.where.not(user: current_user).first
    case first_outcome
    when "win"
      @other_bet_member.outcome = "loss"
    when "tie"
      @other_bet_member.outcome = "tie"
    when "loss"
      @other_bet_member.outcome = "win"
    end
    @other_bet_member.save
    @bet.status = "finished"
    @bet.save
    redirect_to bet_path(@bet)
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
