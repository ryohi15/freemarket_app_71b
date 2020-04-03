class ItemsController < ApplicationController

  before_action :set_item, only:[:show, :destroy]

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
    @images = @item.images
  end

  def destroy
    if @item.destroy
      redirect_to user_path
    else
      render :show
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:user_id, :category_id, :buyer_id, :name, :brand, :content, :price, :seller_id, :prefecture_id, :status_id, :cost_id, :delivery_day_id, images_attributes: [:image])  
  end


  private
  def set_item
    @item = Item.find(params[:id])
  end
end
