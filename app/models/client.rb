class Client < ActiveRecord::Base
  belongs_to :user
  has_many :dependants
  has_many :registrations
  has_many :payments, through: :registrations
  has_many :courses,  through: :registrations
  
  
end
