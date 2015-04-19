class ClientSerializer < ActiveModel::Serializer
  attributes(*Client.attribute_names.map(&:to_sym))

  # has_many :dependants
  # attributes dependants: [2,4,5]

end
