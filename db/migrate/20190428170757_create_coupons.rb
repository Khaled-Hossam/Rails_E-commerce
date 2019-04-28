class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name
      t.timestamp :expiration_date, :null => true
      t.integer :max_usage_number, :null => true
      t.decimal :discount_percentage, :null => true
      t.decimal :max_discount_amount, :null => true

      t.timestamps
    end
  end
end

# rails generate scaffold coupon name:string expiration_date:timestamp max_usage_number:integer discount_percentage:decimal max_discount_amount:decimal

# and added , :null => true 
# to the nullable fields