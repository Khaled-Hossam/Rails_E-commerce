class Store < ApplicationRecord
  belongs_to :user, optional: true
<<<<<<< HEAD


  before_update do
  if (self.user_id != nil )
    user=User.find(self.user_id)
      user.update(isActive: true)
  end
  end


  def to_s
    self.name
  end
=======
  has_many :products
>>>>>>> 71702895df315ac543e9294c0dcf98308d2cd2e3
end


