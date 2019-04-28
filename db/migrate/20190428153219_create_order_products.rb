class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.decimal :purchased_price
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end


# rails generate scaffold order_product purchased_price:decimal order:references product:references state:references 