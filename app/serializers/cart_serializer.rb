class CartSerializer < ActiveModel::Serializer
  attributes :product, :quantity

  def product
    object.product
  end

  

end
