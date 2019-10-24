class UsersController < ApplicationController

  def index
    @users = User.all
    @users.each{|user| UserSerializer.new(user).serializable_hash}
  end

  def show
    this_user
    render json: UserSerializer.new(@user).serializable_hash
  end

  def create
    @user = User.new(user_params)
    @user.add_network
    @user.save ? render json: { user: UserSerializer.new(@user)} , status: :created  : render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
  end

  def update
    this_user
    @user.update(user_params) ? render json: @user : render json: @user.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    this_user
    @user.destroy
  end


  private

  def this_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end

end
