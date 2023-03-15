class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
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

  def show
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    if @item.buy.present? 
     redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
     @item.destroy
      redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :situation_id, :delivery_id, :prefecture_id, :shipping_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    if current_user != @item.user
      redirect_to action: :index
  end
end
end
