class Registration < ActiveRecord::Base
  belongs_to :payment
  belongs_to :client
  belongs_to :dependant
  belongs_to :course

end
