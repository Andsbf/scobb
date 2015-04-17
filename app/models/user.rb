class User < ActiveRecord::Base
  has_one :client
  has_one :employee
  has_secure_password

end
