class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.float :unit_price
      t.integer :discount_quantity
      t.float :sale_price

      t.timestamps
    end
  end
end
