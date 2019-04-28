class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :instock_quantity
      t.references :image, foreign_key: true
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end

# the command t generate scaffold
# rails generate scaffold product name:string description:text price:decimal instock_quantity:integer image:references category:references brand:references store:references