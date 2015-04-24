class Employee < ActiveRecord::Base
  has_many :events
  has_many :paycheques
  has_one :privilege
  has_many :courses, through: :events

  has_secure_password

end
