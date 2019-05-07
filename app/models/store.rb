class Store < ApplicationRecord
  belongs_to :user, optional: true
  has_many :products

  before_update do

    old_user=Store.where(id: self.id).first.user
    if (old_user != nil)
      old_user.update(isActive: false )
    end
    if (self.user_id != nil )
      user=User.find(self.user_id)
      user.update(isActive: true)
    end
  end


  def to_s
    self.name
  end
end


