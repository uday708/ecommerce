class CartItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :cart

  def total_amount
    item_processor.total_price
  end

  def saved_amount
    item_processor.total_saving
  end

  private

  def item_processor
    @item_processor ||= CartItemProcessor.new(self)
  end
end
