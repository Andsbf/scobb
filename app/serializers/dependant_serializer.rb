class DependantSerializer < ActiveModel::Serializer
  attributes(*Dependant.attribute_names.map(&:to_sym))
  # attributes dependant
end
