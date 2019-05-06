class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_one :store
  has_one :cart

  accepts_nested_attributes_for :store

  def to_s
    self.email
  end




end
