class CartsController < ApplicationController
  def show
    render json: user_cart
  end

  def update
    render json: checkout.update_cart(items_parameters[:cart_items])
  end

  def destroy
    render json: checkout.remove_from_cart(items_parameters[:cart_items])
  end

  private

    def user_cart
      current_user.cart || current_user.create_cart
    end

    def checkout
      Checkout.new(user_cart)
    end

    def items_parameters
      params.permit(:cart_items)
    end
end
