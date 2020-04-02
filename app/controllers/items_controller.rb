class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @images = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path notice: '出品しました'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  private

  def item_params
    params.require(:item).permit(:user_id, :category_id, :buyer_id, :name, :brand, :content, :price, :seller_id, :prefecture_id, :status_id, :cost_id, :delivery_day_id, images_attributes: [:image])  
  end
end
