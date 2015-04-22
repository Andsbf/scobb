class EmployeeSerializer < ActiveModel::Serializer
  attributes(*Employee.attribute_names.map(&:to_sym))

  has_many :events, embed: :ids, key: "events", include: true
  has_many :paycheques, embed: :ids, key: "paycheques", include: true
  has_one :privilege, embed: :ids, key: "privilege", include: true
end
