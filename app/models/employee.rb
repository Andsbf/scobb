class Employee < ActiveRecord::Base
  has_many :events
  has_many :paycheques
  belongs_to :user
  belongs_to :employee

end
