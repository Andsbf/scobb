class ClientSerializer < ActiveModel::Serializer
  attributes(*Client.attribute_names.map(&:to_sym))

  has_many :dependants, embed: :ids, key: "dependants", include: true
  # attributes dependants: [2,4,5]

end
