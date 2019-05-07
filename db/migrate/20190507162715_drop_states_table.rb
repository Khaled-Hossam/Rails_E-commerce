class DropStatesTable < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :orders, column: :state_id
    remove_foreign_key :order_products, column: :state_id
    remove_column :orders, :state_id
    remove_column :order_products, :state_id

    drop_table :states

    add_column :orders, :status, :integer, default: 0
    add_column :order_products, :status, :integer, default: 0

  end
end
