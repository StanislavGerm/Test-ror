FactoryBot.define do
  factory :merchant do
    user
    sequence :name do |n|
      "Test#{n} Merchant"
    end
    city         { "Chisinau" }
    street       { "Alba Iulia 75" }
    country_code { "MD" }
  end

  factory :user do
    sequence :email do |n|
      "test#{n}@email.com"
    end
    password { "123456" }
  end
end
