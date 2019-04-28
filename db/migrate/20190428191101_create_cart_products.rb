class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :quantity

    end
  end
end


# rails g model CartProduct product:references user:references quantity:integer
