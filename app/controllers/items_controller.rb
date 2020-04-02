class ItemsController < ApplicationController

  before_action :set_item, only:[:show, :destroy]

  def index
    @items = Item.all
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

  def new
  end


  private
  def set_item
    @item = Item.find(params[:id])
  end
end
