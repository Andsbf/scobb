class Payment < ActiveRecord::Base
  has_one :registration
end
