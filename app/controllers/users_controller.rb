class UsersController < ApplicationController
  def index
    @users = User.where("name iLIKE '%#{params[:s]}%'")
    render json: { items: @users }
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @sent_pending_bets = current_user.sent_pending_bets
    @received_pending_bets = current_user.received_pending_bets
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end
end
