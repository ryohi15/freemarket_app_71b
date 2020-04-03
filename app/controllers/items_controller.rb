class ItemsController < ApplicationController

  before_action :set_item, only:[:show, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @images = @item.images.build
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << [parent.name]
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path notice: '出品しました'
    else
      redirect_to new_item_path
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
    params.require(:item).permit(:user_id, :category_id, :buyer_id, :name, :brand, :content, :seller_id, :prefecture_id, :status_id, :cost_id, :delivery_day_id, :price, images_attributes: [:image])  
  end 

  def set_item
    @item = Item.find(params[:id])
  end
end
