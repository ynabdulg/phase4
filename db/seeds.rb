# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'factory_bot_rails'

#create stores 
store1 = FactoryBot.create(:store, name: "CMUQ", city: "River city", state: "PA", zip: "11111", phone: "1111111111", latitude: 19.999, longitude: 27.888, active: true)
store2 = FactoryBot.create(:store, name: "TA&MQ", city: "River city", state: "OH", zip: "22222", phone: "2222222222", latitude: 19.999, longitude: 27.888, active: true)
store3 = FactoryBot.create(:store, name: "HBKU", city: "River city", state: "WV", zip: "33333", phone: "3333333333", latitude: 19.999, longitude: 27.888, active: true)
store4 = FactoryBot.create(:store, name: "CMUP", city: "River city", state: "PA", zip: "44444", phone: "4444444444", latitude: 19.999, longitude: 27.888, active: false)


 
#create employees 
employee1 = FactoryBot.create(:employee, first_name: "Rachel", last_name: "Brown", ssn: "111111111", date_of_birth: "1973/03/03", phone: "1111111111", role: "employee", active: true, email: "rachel@creamery.com", password: "1234")
employee2 = FactoryBot.create(:employee, first_name: "Alex", last_name: "Brown", ssn: "222222222", date_of_birth: "1993/03/03", phone: "2222222222", role: "manager", active: true, email: "alex@creamery.com", password: "1234")
employee3 = FactoryBot.create(:employee, first_name: "Mark", last_name: "Green", ssn: "333333333", date_of_birth: "2002/03/03", phone: "3333333333", role: "employee", active: false, email: "mark@creamery.com", password: "1234")
employee4 = FactoryBot.create(:employee, first_name: "Yara", last_name: "Nasser", ssn: "444444444", date_of_birth: "2000/03/07", phone: "4444444444", role: "admin", active: false, email: "yara@creamery.com", password: "1234")

#create assignments 
assignment1 = FactoryBot.create(:assignment, employee: employee1, store: store1, start_date: "2018/05/07", end_date: "2018/11/11", pay_level: 1)
assignment2 = FactoryBot.create(:assignment, employee: employee2, store: store2, start_date: "2019/02/02", end_date: nil, pay_level: 2)
assignment3 = FactoryBot.create(:assignment, employee: employee3, store: store3, start_date: "2019/04/12", end_date: nil, pay_level: 3)
assignment4 = FactoryBot.create(:assignment, employee: employee4, store: store1, start_date: "2018/03/03", end_date: "2019/03/03", pay_level: 4)
assignment5 = FactoryBot.create(:assignment, employee: employee1, store: store2, start_date: "2019/03/03", end_date: nil, pay_level: 5)

#create shifts 
shift1 = FactoryBot.create(:shift, assignment: assignment3, date: Date.current, start_time: Time.current, end_time: nil, notes: "shift test")
shift2 = FactoryBot.create(:shift, assignment: assignment2, date: Date.current, start_time: Time.current, end_time: nil, notes: "shift test")
shift3 = FactoryBot.create(:shift, assignment: assignment5, date: Date.current, start_time: Time.current, end_time: nil, notes: "shift test")

#create jobs
job1 = FactoryBot.create(:job, name: "Cleaner", description: "clean creamery", active: true)
job2 = FactoryBot.create(:job, name: "Ice Cream Maker", description: "make ice cream", active: true)
job3 = FactoryBot.create(:job, name: "Ice Cream Scooper", description: "serve ice cream to customers", active: true)
job4 = FactoryBot.create(:job, name: "Social Media covering", description: "post images on istagram", active: false)

#create flavors
flavor1 = FactoryBot.create(:flavor, name: "Mango Madness", active: true)
flavor2 = FactoryBot.create(:flavor, name: "Very Berry", active: true)
flavor3 = FactoryBot.create(:flavor, name: "Chocolate Goodness", active: true)
flavor4 = FactoryBot.create(:flavor, name: "Vanilla", active: false)


#create shift_jobs
shift_job1 = FactoryBot.create(:shift_job, shift: shift1, job: job1)
shift_job2 = FactoryBot.create(:shift_job, shift: shift2, job: job2)
shift_job3 = FactoryBot.create(:shift_job, shift: shift3, job: job3)
shift_job4 = FactoryBot.create(:shift_job, shift: shift1, job: job2)

#create store_flavors
store_flavor1 = FactoryBot.create(:store_flavor, store: store1, flavor: flavor1)
store_flavor2 = FactoryBot.create(:store_flavor, store: store2, flavor: flavor2)
store_flavor3 = FactoryBot.create(:store_flavor, store: store3, flavor: flavor3)
store_flavor3 = FactoryBot.create(:store_flavor, store: store3, flavor: flavor1)



