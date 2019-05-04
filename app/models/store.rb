class Store < ApplicationRecord
  belongs_to :user, optional: true

  def to_s
    @object.name
  end
end


