require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  def setup
    @user = create(:user)
    @menu_item = create_list(:menu_item, 3)
  end

  def test_update_cart
    menu_item_ids = "1,1,1,2"
    put :update, params: {cart_items: menu_item_ids, token: @user.authenticity_token}
    assert_response :ok
  end

  def test_cart_item_list
    menu_item1 = create(:menu_item, name: "Mobile")
    menu_item2 = create(:menu_item, name: "Laptop")
    cart_item = create_list(:cart_item, 2, menu_item: menu_item1, )
    cart_item1 = create_list(:cart_item, 2, menu_item: menu_item2)
    cart = create(:cart, user: @user)
    get :show, params: {token: @user.authenticity_token}
    puts json_response
  end
end
