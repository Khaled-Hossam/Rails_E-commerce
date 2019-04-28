class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.integer :name

      t.timestamps
    end
  end
end

# rails generate scaffold role name:integer

# and in the model we add 

# enum name: { buyer: 0, seller: 1, admin: 2 }