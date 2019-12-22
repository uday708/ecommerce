class CartItemProcessor
  # Class for each Item calculation

  attr_reader :cart_item, :menu_item

  delegate :discount_quantity, :sale_price, :unit_price, to: :menu_item
  delegate :quantity, to: :cart_item

  def initialize(cart_item)
    @cart_item = cart_item
    @menu_item = cart_item.menu_item
  end

  def total_price
    # calculate best possible combination of sale offer and unit sales
    price_for_sales + price_for_unit
  end

  def total_saving
    # calculate saving for requested units
    ((quantity * unit_price) - total_price).round(2)
  end

  private

    def price_for_sales
      # calculate price for requested units using offers
      return 0 if discount_quantity.zero?
      return 0 unless discount_quantity.present?
      (quantity / discount_quantity) * sale_price
    end

    def price_for_unit
      # calculate price for requested units using quantity prices
      discount_quantity ? (quantity % discount_quantity) * unit_price : quantity * unit_price
    end
end
