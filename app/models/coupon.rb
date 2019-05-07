class Coupon < ApplicationRecord
    has_and_belongs_to_many :user

    class << self
        def find_by_name(name)
            where(name: name)
        end

        def coupon_exist?(coupon_name)
            where(name: coupon_name).present?
        end

    end


end
