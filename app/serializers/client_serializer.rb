class ClientSerializer < ActiveModel::Serializer
  attributes(*Client.attribute_names.map(&:to_sym))

  has_many :dependants
end
