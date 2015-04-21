class Registration < ActiveRecord::Base
  belongs_to :payment
  belongs_to :client
  belongs_to :dependant, dependent: :destroy
  belongs_to :course

end
