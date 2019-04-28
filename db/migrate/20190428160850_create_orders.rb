class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.timestamp :date
      t.references :state, foreign_key: true
      t.references :user, foreign_key: true
      t.references :coupon, foreign_key: true

      t.timestamps
    end
  end
end

# rails generate scaffold order date:timestamp state:references user:references coupon:references

# to make the coupon nullable i added in the model
# , optional: true
# to the assosiation that you need to make optional(nullable)