class EmployeeSerializer < ActiveModel::Serializer
  attributes(*Employee.attribute_names.map(&:to_sym),:a_unit,:a_postal,:a_number,:a_street,:a_city)

  has_many :events, embed: :ids, key: "events", include: true
  has_many :paycheques, embed: :ids, key: "paycheques", include: true
  has_one :privilege, embed: :ids, key: "privilege", include: true

  
  def a_unit
    self.address.split(',')[0]
  end

  def a_postal
    self.address.split(',')[1]
  end

  def a_number
    self.address.split(',')[2]
  end

  def a_street
    self.address.split(',')[3]
  end

  def a_city
    self.address.split(',')[4]
  end

end
