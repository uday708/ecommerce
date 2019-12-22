class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  before_save :update_total_amount
  before_save :update_saved_amount

  private

    def update_total_amount
      self.total_price = cart_items.sum(&:total_amount)
    end

    def update_saved_amount
      self.total_saving = cart_items.sum(&:saved_amount)
    end
end
