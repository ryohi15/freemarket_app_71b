class ItemsController < ApplicationController

  def index
    @items = Item.all
  end


  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to user_path
  end

  def new
  end
end
