class UsersController < ApplicationController

  def show
    # @nickname = current_user.nickname
    # @items = current_user.items
  end

  def destroy
    session.delete(:user_id)
    redirect_to controller: :top, action: :index
  end
end
