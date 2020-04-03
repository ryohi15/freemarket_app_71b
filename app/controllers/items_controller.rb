class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @images = @item.images.build
    @categoy = Category.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name

    def get_category_children
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    end

    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
end

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
    params.require(:item).permit(:category_id, :prefecture_id ,:brand, :name, :content, :status_id, :price, :cost_id, :delivery_day_id, :brand, :seller_id, :buyer_id, images_attributes: [:image])
  end

 
end
