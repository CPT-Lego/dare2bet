class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @bets = Bet.all.order(end_time: :asc).where(status: 1)
    redirect_to bets_path if user_signed_in?
  end
end
