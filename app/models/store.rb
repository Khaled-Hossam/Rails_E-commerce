class Store < ApplicationRecord
  belongs_to :user, optional: true
  has_many :products

  def to_s
    @object.name
  end
end


