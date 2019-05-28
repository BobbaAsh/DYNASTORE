class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def set_artist
    @user = User.find(params[:id])
  end

  def artist_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :description)
  end
end
