class CreateWishLists < ActiveRecord::Migration[5.2]
  def change
    create_table :wish_lists do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true

    end
  end
end


# rails g model WishList product:references user:references