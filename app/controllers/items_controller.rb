class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
     @items = Item.all.order(created_at: :desc)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :situation_id, :delivery_id, :prefecture_id, :shipping_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
