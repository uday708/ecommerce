class MenuItemsController < ApplicationController

  def create
    MenuItem.create(menu_item_params)
  end

  def index
    render json: MenuItem.all
  end

  def destroy
    render json: MenuItem.find_by(id: params[:id]).destroy
  end

  private

  def user_cart
    current_user.cart || current_user.create_cart
  end

  def menu_item_params
    params.permit(:name, :unit_price, :discount_quantity, :sale_price)
  end
end
