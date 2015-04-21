class Dependant < ActiveRecord::Base
  belongs_to :client
  has_many :registrations

end
