require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  def setup
    @user = create(:user)
  end

  def test_update_cart
    menu_item = create_list(:menu_item, 2)
    menu_item_ids = "1,1,1,2"
    assert_difference ['Cart.count'], 1 do
      assert_difference ['CartItem.count'], 2 do
        put :update, params: {cart_items: menu_item_ids, token: @user.authenticity_token}
        assert_response :ok
      end
    end
    cart = Cart.last
    assert_equal cart.total_price, json_response['total_price']
    assert_equal cart.total_saving, json_response['total_saving']
    assert json_response['cart_items'].is_a?(Array)
    assert_equal CartItem.first.total_amount, json_response['cart_items'][0]['total_amount']
    assert_equal CartItem.first.saved_amount, json_response['cart_items'][0]['saved_amount']
  end
end
