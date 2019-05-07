class State < ApplicationRecord
    # this to make the name enum
    enum name: { Pending: 0, Confirmed: 1, Delivered: 2 }
    belongs_to :order_product
    belongs_to :order
end
