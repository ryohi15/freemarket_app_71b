class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.images.new
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
  end
  
  private

  def item_params
    params.require(:item).permit(:category_id, :brand, :name, :content, :status, :price, :cost, :date, :brand, :seller_id, :buyer_id, images_attributes: [:image])
  end
end
