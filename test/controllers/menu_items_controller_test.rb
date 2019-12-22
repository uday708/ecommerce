require 'test_helper'

class MenuItemsControllerTest < ActionController::TestCase
  def setup
    @user = create(:user)
    @menu_item = create_list(:menu_item, 2)
  end

  def test_create_menu_item
    assert_difference ['MenuItem.count'], 1 do
      post :create, params: { name: "A", token: @user.authenticity_token, unit_price: 12, discount_quantity: 3, sale_price: 30}, format: :json
      assert_response :success
    end
  end

  def test_list_menu_items
    get :index, params: {token: @user.authenticity_token}
    assert_response :success
    assert_equal 2, json_response.count
  end

  def test_destroy_menu_item
    assert_equal 2, MenuItem.all.count
    delete :destroy, params: {id: @menu_item.first.id, token: @user.authenticity_token}
    assert_response :success
    assert_equal 1, MenuItem.all.count
  end
end
