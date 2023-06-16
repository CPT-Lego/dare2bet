class BetsController < ApplicationController
  before_action :set_bet, only: [:multiform_step_2, :multiform_step_3, :update, :show, :accept, :deny]

  def index
    @bets = Bet.all.order(end_time: :asc).where(status: 1)
  end

  def show
  end

  def around_me
    @bets = Bet.all.order(end_time: :asc).where(status: 1)
    @markers = @bets.geocoded.map do |bet|
      {
        lat: bet.latitude,
        lng: bet.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {bet: bet})
      }
    end
  end

  def multiform_step_1
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.user = current_user
    if @bet.save
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
    redirect_to bet_path(@bet)
  end
 end

  def edit
  end

  def resolve
    @bet = Bet.find(params[:bet_id])
  end

  def set_result
    @bet = Bet.find(params[:bet_id])
    if @bet.update(bet_params)
      @bet.finished!
      redirect_to bet_path(@bet, bet_settled: true)
    else
      render :resolve, status: :unprocessable_entity
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
    @active_bets = current_user.active_bets
    @past_bets = current_user.past_bets
  end

  def accept
    @bet.active!

    redirect_to bet_path(@bet), notice: "You accepted the bet #{@bet.name}!"
  end

  def deny
    @bet.rejected!

    redirect_to profile_path, notice: "You rejected the bet #{@bet.name}"
  end

  private

  def bet_params
    params.require(:bet).permit(:name, :stake, :location, :end_time, :privacy, :status, :tag_id, :outcome, :opponent_id, :winner_id)
  end

  def set_bet
    if params[:bet_id]
      @bet = Bet.find(params[:bet_id])
    else
      @bet = Bet.find(params[:id])
    end
  end
end
