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
    address: "#{[rand(100..9999),''].sample};n; #{Faker::Address.postcode};n; #{Faker::Address.building_number};n; #{Faker::Address.street_address};n;#{Faker::Address.city}",
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
      address: "#{[rand(100..9999),''].sample};n; #{Faker::Address.postcode};n; #{Faker::Address.building_number};n; #{Faker::Address.street_address};n;#{Faker::Address.city}",
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
  60.times do |i|
    clients << Client.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      phone_alternate: Faker::PhoneNumber.cell_phone,
      birthday: Faker::Date.between(50.years.ago, 15.years.ago),
      gender: ['male', 'female'].sample,
      address: "#{[rand(100..9999),''].sample};n; #{Faker::Address.postcode};n; #{Faker::Address.building_number};n; #{Faker::Address.street_address};n;#{Faker::Address.city}",
      notes: [Faker::Lorem.sentence, ""].sample,
      password: "123456",
      password_confirmation: "123456",
      dependants_name: ''
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
      
      a = clients.last
      a.dependants_name  << "#{dependants.last.first_name},"
      a.save
    end

    
    

  end


  #creating courses categories with at least one course and some events
  i = 0
  5.times do |i|
    i += 1
    categories << Category.create!(
      title: "Category #{i}",
      description: Faker::Lorem.sentence(10)
    )

    counter = 0

    rand(1..3).times do |id|
      counter += 1
      courses << Course.create!(
        category: categories.last,
        name: "level #{counter}",
        capacity: rand(10..15),
        session_cost: rand(70..80),
        description: Faker::Lorem.sentence(10),
        level: counter,
        is_full: false,
        num_students: 0
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

  courses.each do |course| 

    course.startDate = course.events.order(:start_time).first.start_time
    course.endDate = course.events.order(:start_time).last.start_time
    course.save

  end


  #associatin clients to registrations/courses
  clients.each do |client|
    @course = courses.sample
    @cost = @course.events.length * @course.session_cost

    if client.dependants.any?

      client.dependants.each do |dependant|

      @course = courses.sample
      
      while @course.is_full
        @course = courses.sample        
      end

      @cost = @course.events.length * @course.session_cost
      @course.num_students += 1
      @course.is_full = true if (@course.num_students == @course.capacity)
      @course.save

      payments << Payment.create!(
        date: Faker::Date.backward(180),
        total: @cost
      )


      registrations << Registration.create!(
        payment: payments.last,
        client: client,
        dependant: dependant,
        course: @course
      )
      a = registrations.last
      a.created_at = payments.last.date
      a.save
      end 

    else
      
      @course = courses.sample

      @cost = @course.events.length * @course.session_cost
      @course.num_students += 1
      @course.save

      payments << Payment.create!(
        date: Faker::Date.backward(180),
        total: @cost
      )


      registrations << Registration.create!(
        payment: payments.last,
        client: client,
        dependant: nil,
        course: @course
      )  

      a = registrations.last
      a.created_at = payments.last.date
      a.save
    end
  end

  p '...done'
end
