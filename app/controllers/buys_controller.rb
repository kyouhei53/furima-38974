class BuysController < ApplicationController

  def index
    @buy = Order.new
  end

  def create
    
    @buy = Order.new(buy_params)
    if @buy.valid?
      @buy.save
       redirect_to root_path
    else
      render 'buys/index'
  end
end


  private

  def buy_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

 
end

