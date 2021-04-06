class AddUserIdToMerchant < ActiveRecord::Migration[6.1]
  def change
  	change_table :merchants do |t|
  		t.belongs_to :user
 		end		
	end
end