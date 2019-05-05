class Store < ApplicationRecord
  belongs_to :user, optional: true


  before_update do
  if (self.user_id != nil )
    user=User.find(self.user_id)
      user.update(isActive: true)
  end
  end


  def to_s
    self.name
  end
end


