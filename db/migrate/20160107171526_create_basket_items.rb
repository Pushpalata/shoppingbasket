class CreateBasketItems < ActiveRecord::Migration
  def change
    create_table :basket_items do |t|
      t.string :product_category
      t.string :description
      t.float :price
      t.integer :quantity
      t.integer :basket_id
      t.float :amount

      t.timestamps
    end
  end
end
