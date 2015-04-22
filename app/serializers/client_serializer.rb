class ClientSerializer < ActiveModel::Serializer
  attributes(*Client.attribute_names.map(&:to_sym),:a_unit,:a_postal,:a_number,:a_street,:a_city)

  has_many :dependants, embed: :ids, key: "dependants", include: true
  has_many :registrations, embed: :ids, key: "registrations", include: true
  has_many :payments, embed: :ids, key: "payments", include: true
  has_many :courses, embed: :ids, key: "courses", include: true
  
  #address structure []

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



