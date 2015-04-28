class Course < ActiveRecord::Base
  belongs_to :category

  has_many :events
  has_many :registrations
  after_create :default_date
  
  def default_date
    self.startDate = Date.today
    self.endDate = Date.today
    self.save
  end
end
  