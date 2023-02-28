FactoryBot.define do
  factory :secound_user, class:User do
    name { "ikko" }
    email { "ikko@example.com" }
    password { "password" }
    admin { false }
  end

  factory :third_user, class:User do
    name { "管理者" }
    email { "admin@admin.com" }
    password { "123456" }
    admin { true }
  end
end