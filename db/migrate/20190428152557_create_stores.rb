class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :summary
      t.belongs_to :user,foreign_key: true,:null => true 
      t.timestamps
    end
  end
end
