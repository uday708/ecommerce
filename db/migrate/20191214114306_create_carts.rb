class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.float :total_price
      t.float :total_saving

      t.timestamps
    end
  end
end
