class RegistrationSerializer < ActiveModel::Serializer
  attributes(*Registration.attribute_names.map(&:to_sym))

   # has_one :dependant, embed: :ids, key: "dependant"#, include: true
   # has_one :payment, embed: :ids, key: "payment"#, include: true
end
