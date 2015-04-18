# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
if Rails.env.development?
  p 'Seeding db...'
  su = User.create!(
    first_name: 'Ms Andrea', 
    last_name:'Good', 
    email:'andrea@good.com', 
    phone: '123456', 
    phone_alternate: '987654', 
    address: 'stanley park, DT Vancouver', 
    notes:'',
    birthday: Faker::Date.between(35.years.ago, 25.years.ago),
    user_type: 'owner',
    password:'123456', 
    password_confirmation:'123456'
  ) 

  Employee.create!( user: su, certification: Faker::Lorem.words.join(' '), hourly_rate: rand(20..30))

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
    employees << User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      birthday: Faker::Date.between(50.years.ago, 16.years.ago),
      gender: ['male', 'female'].sample,
      address: Faker::Address.street_address,
      notes: [Faker::Lorem.sentence, ""].sample,
      user_type: 'employee',
      password: "123456",
      password_confirmation: "123456"
    )

    Employee.create!(
      user: employees.last,
      certification: Faker::Lorem.words.join(' '),
      hourly_rate: rand(20..30)
    )
  end

  #creating clients w/ 0 or up to 2 dependants
  30.times do |i|
    clients << User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      birthday: Faker::Date.between(50.years.ago, 15.years.ago),
      gender: ['male', 'female'].sample,
      address: Faker::Address.street_address,
      notes: [Faker::Lorem.sentence, ""].sample,
      user_type: 'client',
      password: "123456",
      password_confirmation: "123456"
    )

    Client.create!(
      user: clients.last,
      notes: [Faker::Lorem.sentence, ""].sample
    )

    rand(0..2).times do |i|
      dependants << Dependant.create!(
      client: clients.last.client,
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
          employee: employees.sample.employee,  
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
        client: client.client,
        dependant: [client.client.dependants.sample, nil].sample,
        course: @course
      )
    end
  end

  p '...done'
end
