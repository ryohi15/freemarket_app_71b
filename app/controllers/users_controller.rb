class UsersController < ApplicationController

  def show
    @items = Item.all.order("created_at DESC")
  end

  def logout
  end

end
