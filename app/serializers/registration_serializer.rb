class RegistrationSerializer < ActiveModel::Serializer
  attributes(*Registration.attribute_names.map(&:to_sym))

  

end
