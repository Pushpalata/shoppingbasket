class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :transaction_id
      t.string :customer_location
      t.float :sub_total
      t.float :tax_total
      t.float :total_amount

      t.timestamps
    end
  end
end
