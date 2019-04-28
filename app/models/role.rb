class Role < ApplicationRecord
    enum name: { buyer: 0, seller: 1, admin: 2 }

end
