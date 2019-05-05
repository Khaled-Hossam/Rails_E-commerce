class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_one :store
<<<<<<< HEAD

  accepts_nested_attributes_for :store

=======
>>>>>>> 71702895df315ac543e9294c0dcf98308d2cd2e3
  def to_s
    self.email
  end




end
