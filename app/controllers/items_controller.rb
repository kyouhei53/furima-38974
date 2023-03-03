class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).parmit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday)
  end
end
