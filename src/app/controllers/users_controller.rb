class usersController < ApplicationController

  include JwtAuthenticator
  before_action :jwt_authenticate, except: :create

  def index
    user = User.all
    render json: {
      users: users
    }, status: :ok
  end

  def show
    @user = User.find(params[:id])

    render json: {
      user: @user
    }, status: :ok
  end

  def new
    @user = User.new
    reder json: {
      user: @user
    },status: :ok
  end

  def create
    @user = user.new(user_params)
    @user.save

    render json: {
      user: @user
    }, status: :ok
  end

  def edit
    @user = User.find(params[:id])
    render json: {
      user: @user
    }, status: :ok
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: {
      user: @user
    }, status: :ok
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {
      user: @user
    }, status: :ok
  end

  private

  def user_params
    params.require(:item).permit(:email, :password, :password_confirmation)
  end

end