class BetsController < ApplicationController
  before_action :set_bet, only: [:multiform_step_2, :multiform_step_3, :update, :show]

  def index
    @bets = Bet.all
  end

  def show
  end

  def around_me
    @bets = Bet.all
    @markers = @bets.geocoded.map do |bet|
      {
        lat: bet.latitude,
        lng: bet.longitude
      }
    end
  end

  def multiform_step_1
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    if @bet.save
      BetMember.create(bet: @bet, user: current_user)
      redirect_to bet_multiform_step_2_path(@bet)
    else
      render :multiform_step_1, status: :unprocessable_entity
    end
  end

  def multiform_step_2
  end

  def multiform_step_3
  end

 def update
  @bet.update(bet_params)
  if params[:step_2]
    redirect_to bet_multiform_step_3_path(@bet)
  else
    redirect_to bets_path
  end
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

  def set_bet
    if params[:bet_id]
      @bet = Bet.find(params[:bet_id])
    else
      @bet = Bet.find(params[:id])
    end
  end
end
