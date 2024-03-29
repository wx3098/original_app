# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
  name: "管理者",
  email: "admin_guest20@example.com",
  password: "admin12345",
  password_confirmation: "admin12345",
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

hospital1 = Hospital.create(name: '病院A', email: 'hospital1@example.com', password: 'password1')
hospital2 = Hospital.create(name: '病院B', email: 'hospital2@example.com', password: 'password2')
hospital3 = Hospital.create(name: '病院C', email: 'hospital3@example.com', password: 'password3')
hospital4 = Hospital.create(name: '病院D', email: 'hospital4@example.com', password: 'password4')
hospital5 = Hospital.create(name: '病院E', email: 'hospital5@example.com', password: 'password5')
hospital1.save!
hospital2.save!
hospital3.save!
hospital4.save!
hospital5.save!


department1 = MedicalDepartment.create(name: '皮膚科', hospital: hospital1, wait_time: rand(5..20))
department2 = MedicalDepartment.create(name: '内科', hospital: hospital1, wait_time: rand(5..20))
department3 = MedicalDepartment.create(name: '小児科', hospital: hospital2, wait_time: rand(5..20))
department4 = MedicalDepartment.create(name: '外科', hospital: hospital2, wait_time: rand(5..20))
department5 = MedicalDepartment.create(name: '眼科', hospital: hospital3, wait_time: rand(5..20))
department6 = MedicalDepartment.create(name: '耳鼻咽喉科', hospital: hospital3, wait_time: rand(5..20))
department7 = MedicalDepartment.create(name: '整形外科', hospital: hospital4, wait_time: rand(5..20))
department8 = MedicalDepartment.create(name: 'リハビリテーション科', hospital: hospital4, wait_time: rand(5..20))
department9 = MedicalDepartment.create(name: '産婦人科', hospital: hospital5, wait_time: rand(5..20))
department10 = MedicalDepartment.create(name: '心療内科', hospital: hospital5, wait_time: rand(5..20))


user_ids = User.pluck(:id)
hospital_ids = Hospital.pluck(:id)

5.times do
  Favorite.create!(
    user_id: user_ids.sample,
    hospital_id: hospital_ids.sample
  )
end

