class CartItemSerializer < ActiveModel::Serializer
  attributes :total_amount, :saved_amount, :menu_item_name, :quantity

  def menu_item_name
    object.menu_item.name
  end
end
