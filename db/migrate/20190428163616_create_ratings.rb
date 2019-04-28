class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.text :comment, :null => true 
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end


# rails generate scaffold rating value:integer comment:text date:timestamp product:references user:references

# and added , :null => true 
# to comment to make it nullable