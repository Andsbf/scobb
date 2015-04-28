class Client < ActiveRecord::Base
  
  has_many :dependants
  has_many :registrations
  has_many :payments, through: :registrations
  has_many :courses,  through: :registrations
  has_many :events,  through: :courses

  has_secure_password
  
  
end
