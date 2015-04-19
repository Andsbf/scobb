class ClientSerializer < ActiveModel::Serializer
  attributes(*Client.attribute_names.map(&:to_sym))

  has_many :dependants, embed: :ids, key: "dependants", include: true
  has_many :registrations, embed: :ids, key: "registrations", include: true
  has_many :payments, embed: :ids, key: "payments", include: true
  has_many :courses, embed: :ids, key: "courses", include: true
  
end


