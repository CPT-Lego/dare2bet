class UsersController < ApplicationController
  def index
    @users = User.where("name iLIKE '%#{params[:s]}%'")
    render json: { items: @users }
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end
end
