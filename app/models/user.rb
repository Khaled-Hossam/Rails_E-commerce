class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_one :store
  has_one :cart
  has_and_belongs_to_many :coupons

  accepts_nested_attributes_for :store

  def to_s
    self.email
  end
  def can_use_coupon?(coupon_name)
    return false unless  Coupon.coupon_exist?(coupon_name)
    return user_coupons.coupon_exist?(coupon_name) ? false : true
  end
  
  def user_coupons
    self.coupons
  end
  
  class << self
    def clear_user_coupon()
      
    end
  end
  
  
  
end

# u.coupons.delete(2)
# User.find(7).can_use_coupon?('Best Buds')