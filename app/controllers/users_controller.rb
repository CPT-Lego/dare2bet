class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @markers = @users.geocoded.map do |flat|
      {
        lat: user.latitude,
        lng: user.longitude
      }
  end
end
