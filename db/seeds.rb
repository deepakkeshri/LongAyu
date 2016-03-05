# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    roles = Role.create([{name: 'admin'},{name: 'branch_admin'},{name: 'branch'},{name: 'patient'}])
    
    account = Account.new({mobile: '8423542270', email: 'admin@gmail.com',password: 'Rama@123',password_confirmation: 'Rama@123'})
    account.skip_confirmation!
    account.save!
    account.add_role :admin
    
    
    account = Account.new({mobile: '8423542261', email: 'clinic1@gmail.com',password: 'Rama@123',password_confirmation: 'Rama@123'})
    account.skip_confirmation!
    account.save!
    account.add_role :branch_admin
        branch_admin = Centre.create(account_id: account.id, name: 'clinic1',centre_type_id: '1')
        branch_admin.centre_id = branch_admin.id
          Service.create(centre_id: branch_admin.id,name: 'service11',price: '100',service_type_id: '1')
          Service.create(centre_id: branch_admin.id,name: 'service12',price: '100',service_type_id: '2')
          Service.create(centre_id: branch_admin.id,name: 'service13',price: '100',service_type_id: '3')
          Facility.create(centre_id: branch_admin.id,name: 'facility11',price: '100',facility_type_id: '1')
          Facility.create(centre_id: branch_admin.id,name: 'facility12',price: '100',facility_type_id: '2')
          Facility.create(centre_id: branch_admin.id,name: 'facility13',price: '100',facility_type_id: '3')
          account = Account.new({mobile: '8423542262', email: 'clinic11@gmail.com',password: 'Rama@123',password_confirmation: 'Rama@123'})
          account.skip_confirmation!
          account.save!
          branch = Centre.create(account_id: account.id,centre_id:branch_admin.id,name: 'clinic11',centre_type_id: '2')
          Service.create(centre_id: branch.id,name: 'service21',price: '100',service_type_id: '1')
          Service.create(centre_id: branch.id,name: 'service22',price: '100',service_type_id: '2')
          Service.create(centre_id: branch.id,name: 'service23',price: '100',service_type_id: '3')
          Facility.create(centre_id: branch.id,name: 'facility21',price: '100',facility_type_id: '1')
          Facility.create(centre_id: branch.id,name: 'facility22',price: '100',facility_type_id: '2')
          Facility.create(centre_id: branch.id,name: 'facility23',price: '100',facility_type_id: '3')

          account = Account.new({mobile: '8423542263', email: 'clinic12@gmail.com',password: 'Rama@123',password_confirmation: 'Rama@123'})
          account.skip_confirmation!
          account.save!
          branch = Centre.create(account_id: account.id,centre_id:branch_admin.id,name: 'clinic12',centre_type_id: '3')
          Service.create(centre_id: branch.id,name: 'service31',price: '100',service_type_id: '1')
          Service.create(centre_id: branch.id,name: 'service32',price: '100',service_type_id: '2')
          Service.create(centre_id: branch.id,name: 'service33',price: '100',service_type_id: '3')
          Facility.create(centre_id: branch.id,name: 'facility31',price: '100',facility_type_id: '1')
          Facility.create(centre_id: branch.id,name: 'facility32',price: '100',facility_type_id: '2')
          Facility.create(centre_id: branch.id,name: 'facility33',price: '100',facility_type_id: '3')
          
    account = Account.new({mobile: '8423542251', email: 'clinic2@gmail.com',password: 'Rama@123',password_confirmation: 'Rama@123'})
    account.skip_confirmation!
    account.save!
    account.add_role :branch_admin
        branch_admin = Centre.create(account_id: account.id, name: 'clinic2',centre_type_id: '1')
        branch_admin.centre_id = branch_admin.id
          Service.create(centre_id: branch_admin.id,name: 'service11',price: '100',service_type_id: '1')
          Service.create(centre_id: branch_admin.id,name: 'service12',price: '100',service_type_id: '2')
          Service.create(centre_id: branch_admin.id,name: 'service13',price: '100',service_type_id: '3')
          Facility.create(centre_id: branch_admin.id,name: 'facility11',price: '100',facility_type_id: '1')
          Facility.create(centre_id: branch_admin.id,name: 'facility12',price: '100',facility_type_id: '2')
          Facility.create(centre_id: branch_admin.id,name: 'facility13',price: '100',facility_type_id: '3')
          account = Account.new({mobile: '8423542252', email: 'clinic21@gmail.com',password: 'Rama@123',password_confirmation: 'Rama@123'})
    account.skip_confirmation!
    account.save!
    branch = Centre.create(account_id: account.id,centre_id:branch_admin.id,name: 'clinic21',centre_type_id: '2')
          Service.create(centre_id: branch.id,name: 'service21',price: '100',service_type_id: '1')
          Service.create(centre_id: branch.id,name: 'service22',price: '100',service_type_id: '2')
          Service.create(centre_id: branch.id,name: 'service23',price: '100',service_type_id: '3')
          Facility.create(centre_id: branch.id,name: 'facility21',price: '100',facility_type_id: '1')
          Facility.create(centre_id: branch.id,name: 'facility22',price: '100',facility_type_id: '2')
          Facility.create(centre_id: branch.id,name: 'facility23',price: '100',facility_type_id: '3')
          account = Account.new({mobile: '8423542253', email: 'clinic22@gmail.com',password: 'Rama@123',password_confirmation: 'Rama@123'})
    account.skip_confirmation!
    account.save!
    branch = Centre.create(account_id: account.id,centre_id:branch_admin.id,name: 'clinic22',centre_type_id: '3')
          Service.create(centre_id: branch.id,name: 'service31',price: '100',service_type_id: '1')
          Service.create(centre_id: branch.id,name: 'service32',price: '100',service_type_id: '2')
          Service.create(centre_id: branch.id,name: 'service33',price: '100',service_type_id: '3')
          Facility.create(centre_id: branch.id,name: 'facility31',price: '100',facility_type_id: '1')
          Facility.create(centre_id: branch.id,name: 'facility32',price: '100',facility_type_id: '2')
          Facility.create(centre_id: branch.id,name: 'facility33',price: '100',facility_type_id: '3')
    
    
    centre_type = CentreType.create({name: 'Diagonastic Lab'})
      service_type = ServiceType.create({centre_type_id: centre_type.id, name: 'Brain'})
      service_type = ServiceType.create({centre_type_id: centre_type.id, name: 'MRI'})
        
    centre_type = CentreType.create({name: 'Gym Centre'})
      service_type = ServiceType.create({centre_type_id: centre_type.id, name: 'Gym type1'})
      service_type = ServiceType.create({centre_type_id: centre_type.id, name: 'Gym type2'})
       
    centre_type = CentreType.create({name: 'Yoga Centre'})
      service_type = ServiceType.create({centre_type_id: centre_type.id, name: 'Regular Yoga'})
      service_type = ServiceType.create({centre_type_id: centre_type.id, name: 'Weekly Yoga'})
      
    facility_types = FacilityType.create([
      {name: 'Blood Sample Collection'},
      {name: 'Ambulance Service'},
      {name: 'To and Fro Cab'},
      {name: 'Online Reports'},
      {name: '27*7 Helpline'}
    ])
    
    staff_types = StaffType.create([
      {name: 'Booking Staff'},
      {name: 'Medical Staff'},
      {name: 'Emergency Staff'},
      {name: 'Ambulance Staff'},
      {name: '27*7 Customer Care Staff'}
    ])
    
    country = Country.create(name: 'India',currency: 'INR',mobile_code: '+91')
      state = State.create(country_id: country.id,name: 'UP')
        city = City.create([
          {name: 'Varanasi'},
          {name: 'Kanpur'}
        ])
      state = State.create(country_id: country.id,name: 'MP')
        city = City.create([
          {name: 'Bhopal'}
        ])
    
    country = Country.create(name: 'USA',currency: 'USD',mobile_code: '+01')
      state = State.create(country_id: country.id,name: 'New York')
        city = City.create([
          {name: 'city1'},
          {name: 'city2'}
        ])
    
    pincode = Postalcode.create([
      {name: '231219'},
      {name: '221005'}
    ])
    
    country_mobile_code = CountryMobileCode.create([
      {name: '+91'},
      {name: '+80'}
    ])
    
    language = Language.create([
      {name: 'English'},
      {name: 'Hindi'}
    ])
    
    message_type = MessageType.create({name: 'Title'})
    message = Message.create([
      {message_type_id: message_type.id, name: 'Mr.'},
      {message_type_id: message_type.id, name: 'Ms.'}
    ])
    
    message_type = MessageType.create({name: 'Degree'})
    message = Message.create([
      {message_type_id: message_type.id, name: 'High School'},
      {message_type_id: message_type.id, name: 'B.tech'}
    ])
    
    message_type = MessageType.create({name: 'Designation'})
    message = Message.create([
      {message_type_id: message_type.id, name: 'Doctor'},
      {message_type_id: message_type.id, name: 'Nurse'}
    ])
    
    message_type = MessageType.create({name: 'Specialization'})
    message = Message.create([
      {message_type_id: message_type.id, name: 'Dentist'},
      {message_type_id: message_type.id, name: 'Ortho'}
    ])
    
    message_type = MessageType.create({name: 'Qualification'})
    message = Message.create([
      {message_type_id: message_type.id, name: 'Matriculate'},
      {message_type_id: message_type.id, name: 'Graduate'}
    ])
    
    message_type = MessageType.create({name: 'Employee_count'})
    message = Message.create([
      {message_type_id: message_type.id, name: '1-10'},
      {message_type_id: message_type.id, name: '>10'}
    ])
  