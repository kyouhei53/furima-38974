class ItemsController < ApplicationController



  def index
    @item = Item.all
  end

  def create
    @user = User.new
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
    @user = User.new
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :situation_id, :delivery_id, :prefecture_id, :shipping_id, :price, :image).merge(user_id: current_user.id)
  end

  

end