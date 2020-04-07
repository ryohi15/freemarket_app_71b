class ItemsController < ApplicationController

  before_action :set_item, only:[:show, :destroy]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
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
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end


  def show
    @images = @item.images
    @prefecture = Prefecture.find @item.prefecture_id
    @categories = @item.category
    @parent = @categories.root
    @child = @categories.parent
    @grandchild = @item.category
  end

  def destroy
    if @item.destroy
      redirect_to user_path
    else
      render :show
    end
  end


  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :brand,:content, :price, :seller_id, :prefecture_id, :status_id, :cost_id, :delivery_day_id, :category_id, images_attributes: [:image]).merge(user_id: current_user.id, seller_id: current_user.id)
  end
end
