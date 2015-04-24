class DependantSerializer < ActiveModel::Serializer
  attributes(*Dependant.attribute_names.map(&:to_sym))

  has_many :registrations, embed: :ids, key: "registrations"#, include: true
end
