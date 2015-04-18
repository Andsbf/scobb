class Course < ActiveRecord::Base
  belongs_to :category

  has_many :events
end
