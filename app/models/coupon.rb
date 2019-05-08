class Coupon < ApplicationRecord
    has_and_belongs_to_many :users


    def check_expiration_date?
        if self.expiration_date.present?
            return  self.expiration_date >= Date.today
        end
        return true
    end 

    def check_number_of_usage?
        if self.max_usage_number.present?
            return self.max_usage_number > number_of_uses
        end
        return true
    end

    def number_of_uses
        self.users.count 
    end

    def valid?
        self.check_expiration_date? && self.check_number_of_usage?
    end

    def coupon_discount(price)
        [self.discount_percentage * price /100, self.max_discount_amount].min
    end

    class << self
        def find_by_name(name)
            find_by(name: name)
        end
        
    end
end
