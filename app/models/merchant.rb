class Merchant < ApplicationRecord
	belongs_to :user
<<<<<<< HEAD

	validates :user,         presence: true
	validates :name,         presence: true, length: { minimum: 4, maximum: 16 }, uniqueness: true
	validates :city,         presence: true, length: { minimum: 4, maximum: 16 }
	validates :street,       presence: true, length: { minimum: 4, maximum: 60 }
	validates :country_code, presence: true, length: { minimum: 2, maximum: 16 }

	def self.search(string)
		if string
			where(["name LIKE ?","%#{string}%"])
=======
	validates :user, presence: true
	validates :name, :city, :street, :country_code, presence: true
	def self.search(search)
		if search
			where(["name LIKE ?","%#{search}%"])	
>>>>>>> a8e765b... css index
		else
			all
		end
	end
end
		