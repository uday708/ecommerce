class Checkout
  attr_accessor :cart

  delegate :total_price, :total_saving, to: :cart

  def initialize(cart)
    @cart = cart
  end

  def update_cart(cart_items)
    list_item = parse_items(cart_items)
    cart.cart_items.where(menu_item_id: list_item.keys).each do |cart_item|
      cart_item.update(quantity: list_item.delete(cart_item.menu_item_id.to_s))
    end
    list_item.each do |menu_item_id, quantity|
      cart.cart_items.build(menu_item_id: menu_item_id, quantity: quantity)
    end
    cart.save
  end

  def remove_from_cart(cart_items)
    item_ids = menu_item_ids(cart_items).uniq
    cart.cart_items.where(menu_item_id: item_ids).destroy_all
    true
  end

  private

    def parse_items(items)
      menu_item_ids(items).inject(Hash.new(0)) { |total, element| total[element] += 1; total}
    end

    def menu_item_ids(items)
      items.split(",").reject{ |obj| obj.to_s.empty? }.map(&:strip)
    end
end
