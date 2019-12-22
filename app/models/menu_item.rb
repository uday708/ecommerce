class MenuItem < ApplicationRecord
  has_one :cart_item, dependent: :destroy
  validates_uniqueness_of :name
  validates_presence_of :unit_price
  validates :sale_price, presence: true, if: ->(x){ x.discount_quantity.present?}
end
