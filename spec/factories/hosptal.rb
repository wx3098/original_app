FactoryBot.define do
 
  
  factory :hospital1, class: Hospital do
    name { "高橋病院" }
    email { "user11@die.com" }
    password { "222222" }
    password_confirmation { "222222" }
  end
end