class UsersController < ApplicationController
  # before_action :require_signed_in!, only: [:show]
  # before_action :require_signed_out!, only: [:new, :create]

  def new; end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end