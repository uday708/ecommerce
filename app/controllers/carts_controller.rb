class CartsController < ApplicationController
  def show
    render json: user_cart, serializer: CartSerializer
  end

  def update
    if checkout.update_cart(items_parameters[:cart_items])
      render json: "Cart Updated Successfully", status: :ok
    else
      render json: "Error in Update Cart", status: :unprocessable_entity
    end
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
