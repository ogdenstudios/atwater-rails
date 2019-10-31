FactoryBot.define do
    factory :user do
      sequence :email do |n|
        "user#{n}@theatwatergroup.com"
      end
      sequence :password do |n|
        "password#{n}"
      end
    end
  end