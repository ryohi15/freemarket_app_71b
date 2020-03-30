class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :category_id, :brand, :name, :content, :status, :price, :cost, :date, images_attributes: [:image])
  end
end
