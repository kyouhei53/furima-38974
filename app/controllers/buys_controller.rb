class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @buy = Order.new
    if current_user == @item.user
      redirect_to root_path
  end

  def create
    @buy = Order.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
       redirect_to root_path
    else
      render 'buys/index'
  end
end


  private

  def buy_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

