require "rails_helper"

Rspec.describe Merchant, type: :model do 
let!(:merchant1) { FactoryBot.create :merchant }

context 'validation test' do
it "is valid with valid attributes" do
expect(merchant1).to be_valid
end
it "is not valid without a name" do
merchant.name = nil
expect(merhcant1).to_not be_valid
end
end
end