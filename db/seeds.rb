# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
  name: "管理者",
  email: "admin_guest@example.com",
  password: "admin1234",
  password_confirmation: "admin1234",
  admin: true
)

user1 = User.create!(
  name: "test1",
  email: "guest1@example.com",
  password: "test1234",
  password_confirmation: "test1234",
  admin: false
)

user2 = User.create!(
  name: "test2",
  email: "guest2@example.com",
  password: "test21234",
  password_confirmation: "test21234",
  admin: false
)

user3 = User.create!(
  name: "test3",
  email: "test3guest@example.com",
  password: "test31234",
  password_confirmation: "test31234",
  admin: false
)

user4 = User.create!(
  name: "test4",
  email: "test4@example.com",
  password: "test41234",
  password_confirmation: "test41234",
  admin: true
)

hospital1 = Hospital.create!(
  name: "サンプル病院",
  email: "sample1@example.com",
  password: "password",
  password_confirmation: "password",
)

hospital2 = Hospital.create!(
  name: "サンプル病院1",
  email: "sample2@example.com",
  password: "password",
  password_confirmation: "password"
)

hospital3 = Hospital.create!(
  name: "サンプル病院2",
  email: "sample3@example.com",
  password: "password",
  password_confirmation: "password"
)

hospital4 = Hospital.create!(
  name: "サンプル病院3",
  email: "sample4@example.com",
  password: "password",
  password_confirmation: "password"
)

hospital5 = Hospital.create!(
  name: "サンプル病院4",
  email: "sample5@example.com",
  password: "password",
  password_confirmation: "password"
)

medical_departments1 = ["整形外科", "内科", "耳鼻科", "皮膚科", "歯科"]
medical_departments1.each do |name|
  department = MedicalDepartment.create!(name: name)
  hospital1.hospital_medical_departments.create!(medical_department: department)
end

medical_departments2 = ["呼吸器内科", "消化器内科", "小児科", "脳神経外科", "産婦人科"]
medical_departments2.each do |name|
  department = MedicalDepartment.create!(name: name)
  hospital2.hospital_medical_departments.create!(medical_department: department)
end

medical_departments3 = ["泌尿器科", "眼科", "心臓血管外科", "リハビリテーション科", "総合診療科"]
medical_departments3.each do |name|
  department = MedicalDepartment.create!(name: name)
  hospital3.hospital_medical_departments.create!(medical_department: department)
end

medical_departments4 = ["外科", "放射線科", "麻酔科", "アレルギー科", "精神科"]
medical_departments4.each do |name|
  department = MedicalDepartment.create!(name: name)
  hospital4.hospital_medical_departments.create!(medical_department: department)
end

medical_departments5 = ["乳腺外科", "人工透析", "眼科", "形成外科", "耳鼻咽喉科"]
medical_departments5.each do |name|
  department = MedicalDepartment.create!(name: name)
  hospital5.hospital_medical_departments.create!(medical_department: department)
end
# hospitals = Hospital.all
# hospitals = hospitals.map{|hospital|hospital.id}
# medicaldepartments = ["整形外科", "内科", "耳鼻科", "皮膚科", "歯科"]

# 10.times{|h|
#   MedicalDepartment.create!(
#     wait_time: rand(5..20),
#     hospital_id: hospitals.id,
#     name: medicaldepartments.sample
#   )
# }

user_ids = User.pluck(:id)
hospital_ids = Hospital.pluck(:id)

5.times do
  Favorite.create!(
    user_id: user_ids.sample,
    hospital_id: hospital_ids.sample
  )
end

