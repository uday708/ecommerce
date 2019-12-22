class CartSerializer < ActiveModel::Serializer
  attributes :total_price, :total_saving
  has_many :cart_items, serializer: CartItemSerializer
end
