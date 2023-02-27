# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.create!(
#   name: "管理者",
#   email: "admin_guest@example.com",
#   password: "admin1234",
#   password_confirmation: "admin1234",
#   admin: true
# )

# user1 = User.create!(
#   name: "test1",
#   email: "guest1@example.com",
#   password: "test1234",
#   password_confirmation: "test1234",
#   admin: false
# )

# user2 = User.create!(
#   name: "test2",
#   email: "guest2@example.com",
#   password: "test21234",
#   password_confirmation: "test21234",
#   admin: false
# )

# user3 = User.create!(
#   name: "test3",
#   email: "test3guest@example.com",
#   password: "test31234",
#   password_confirmation: "test31234",
#   admin: false
# )

# user4 = User.create!(
#   name: "test4",
#   email: "test4@example.com",
#   password: "test41234",
#   password_confirmation: "test41234",
#   admin: true
# )

# Hospital.create!(
#   name: "サンプル病院",
#   email: "sample@example.com",
#   password: "password",
#   password_confirmation: "password",
# )

# Hospital.create!(
#   name: "サンプル病院1",
#   email: "sample1@example.com",
#   password: "password",
#   password_confirmation: "password"
# )

# Hospital.create!(
#   name: "サンプル病院2",
#   email: "sample2@example.com",
#   password: "password",
#   password_confirmation: "password"
# )

# Hospital.create!(
#   name: "サンプル病院3",
#   email: "sample3@example.com",
#   password: "password",
#   password_confirmation: "password"
# )

# Hospital.create!(
#   name: "サンプル病院4",
#   email: "sample4@example.com",
#   password: "password",
#   password_confirmation: "password"
# )


hospitals = Hospital.all
hospitals = hospitals.map{|hospital|hospital.id}
medicaldepartments = ["整形外科", "内科", "耳鼻科", "皮膚科", "歯科"]

100.times{|h|
  MedicalDepartment.create!(
    wait_time: rand(5..60),
    hospital_id: hospitals.sample,
    name: medicaldepartments.sample
  )
}

