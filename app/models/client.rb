class Client < ActiveRecord::Base
  belongs_to :user
  has_many :dependants
  has_many :registrations
  has_many :payments, through: :registrations

  # accepts_nested_attributes_for :dependants, :allow_destroy => true

end
