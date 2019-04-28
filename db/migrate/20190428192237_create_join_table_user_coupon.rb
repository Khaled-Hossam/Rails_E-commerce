class CreateJoinTableUserCoupon < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :coupons do |t|
      # t.index [:user_id, :coupon_id]
      t.index [:coupon_id, :user_id]
    end
  end
end


# rails g migration CreateJoinTableUserCoupon user coupon