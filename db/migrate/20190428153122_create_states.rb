class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.integer :name

      t.timestamps
    end
  end
end


# rails generate scaffold state name:integer

# and in the model we add 

# enum name: { pending: 0, confirmed: 1, delivered: 2 }