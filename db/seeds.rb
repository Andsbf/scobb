# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
if Rails.env.development?
  p 'Seeding db...'
  su = Employee.create!(
    first_name: 'Ms Andrea', 
    last_name:'Good', 
    email:'andrea@good.com', 
    phone: '123456', 
    phone_alternate: '987654', 
    gender: 'female',
    address: 'stanley park, DT Vancouver', 
    birthday: Faker::Date.between(35.years.ago, 25.years.ago),
    notes: [Faker::Lorem.sentence, ""].sample,
    certification: 'Business owner',
    hourly_rate: '50',
    password:'123456', 
    password_confirmation:'123456'
  ) 

  su.create_privilege(privileges1: true, privileges2: true, privileges3: true, privileges4: true)

  employees = []
  clients = []
  dependants = []
  categories = []
  courses = [] 
  registrations = []
  events = []
  payments = []
   
  #creating employees    
  5.times do |i|
    employees << Employee.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      phone_alternate: Faker::PhoneNumber.cell_phone,
      birthday: Faker::Date.between(50.years.ago, 16.years.ago),
      gender: ['male', 'female'].sample,
      address: Faker::Address.street_address,
      certification: Faker::Lorem.words.join(' '),
      hourly_rate: rand(20..30),
      notes: [Faker::Lorem.sentence, ""].sample,
      password: "123456",
      password_confirmation: "123456"
    )
    employees.last.create_privilege(
      privileges1: [true, false].sample,
      privileges2: [true, false].sample,
      privileges3: [true, false].sample,
      privileges4: [true, false].sample
      )
  end

  #creating clients w/ 0 or up to 2 dependants
  30.times do |i|
    clients << Client.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      phone_alternate: Faker::PhoneNumber.cell_phone,
      birthday: Faker::Date.between(50.years.ago, 15.years.ago),
      gender: ['male', 'female'].sample,
      address: Faker::Address.street_address,
      notes: [Faker::Lorem.sentence, ""].sample,
      password: "123456",
      password_confirmation: "123456"
    )

    rand(0..2).times do |i|
      dependants << Dependant.create!(
      client: clients.last,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birthday: Faker::Date.between(18.years.ago, 1.years.ago),
      gender: ['male', 'female'].sample,
      notes: [Faker::Lorem.sentence, ""].sample
      )
    end
  end


  #creating courses categories with at least one course and some events
  5.times do |i|
    categories << Category.create!(
      title: Faker::Company.name,
      description: Faker::Lorem.sentence(10)
    )
    rand(1..3).times do |id|
      courses << Course.create!(
        category: categories.last,
        name: Faker::Company.name,
        capacity: rand(10..25),
        session_cost: rand(70..80)
      )
    

      rand(5..10).times do |i|
        events << Event.create!(
          employee: employees.sample,  
          course: courses.last,
          start_time: Faker::Date.forward(180),
          duration:  rand(1..3)
        )
      end
    end
  end


  #associatin clients to registrations/courses
  clients.each do |client|
    @course = courses.sample
    @cost = @course.events.length * @course.session_cost

    rand(1..2).times do |i|
      payments << Payment.create!(
        date: Faker::Date.forward(1),
        total: @cost
        )
    
      registrations << Registration.create!(
        payment: payments.last,
        client: client,
        dependant: [client.dependants.sample, nil].sample,
        course: @course
      )
    end
  end

  p '...done'
end
