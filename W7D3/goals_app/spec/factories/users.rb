FactoryBot.define do
    factory :user do 
      username { Faker::Cannabis.buzzword }
      password { 'password123' }
    end
  end