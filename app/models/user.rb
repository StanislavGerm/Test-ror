class User < ApplicationRecord
<<<<<<< HEAD
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :merchants
=======
  has_many :merchants
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
>>>>>>> a8e765b... css index
end