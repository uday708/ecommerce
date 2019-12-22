class MenuItemsController < ApplicationController

  def create
    menu_item = MenuItem.new(menu_item_params)
    if menu_item.save
      render json: "Menu item created succeefully."
    else
      render json: "#{menu_item.errors.messages} in creation of menu item", status: :unprocessable_entity
    end
  end

  def index
    render json: MenuItem.all
  end

  def destroy
    if menu_item = MenuItem.find_by(id: params[:id])
      render json: menu_item.destroy
    else
      render json: "Error deleting menu item", status: :unprocessable_entity
    end
  end

  private

  def user_cart
    current_user.cart || current_user.create_cart
  end

  def menu_item_params
    params.permit(:name, :unit_price, :discount_quantity, :sale_price)
  end
end
