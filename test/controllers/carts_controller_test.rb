require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  def setup
    @user = create(:user)
  end

  def test_update_cart
    menu_item = create_list(:menu_item, 2)
    menu_item_ids = "1,1,1,2"
    put :update, params: {cart_items: menu_item_ids, token: @user.authenticity_token}
    assert_response :ok
  end

  def test_cart_item_list
    menu_item = create(:menu_item, unit_price: 15, discount_quantity: 2, sale_price: 20, name: "Clothes")
    cart = create(:cart, user: @user)
    cart_item = create(:cart_item, menu_item: menu_item, cart: cart)
    get :show, params: {token: @user.authenticity_token}
    puts json_response.has_key?('total_price')
    assert json_response.has_key?('total_price')
    assert json_response.has_key?('total_saving')
    assert json_response.has_key?('cart_items')
    assert json_response['cart_items'].is_a?(Array)
    assert json_response['cart_items'][0].has_key?('total_amount')
    assert json_response['cart_items'][0].has_key?('saved_amount')
    assert json_response['cart_items'][0].has_key?('menu_item_name')
    assert json_response['cart_items'][0].has_key?('quantity')
  end
end
