class State < ApplicationRecord
    # this to make the name enum
    enum name: { pending: 0, confirmed: 1, delivered: 2 }
end
