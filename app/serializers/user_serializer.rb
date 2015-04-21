class UserSerializer < ActiveModel::Serializer
  attributes(*User.attribute_names.map(&:to_sym))
  
  has_one :client, embed: :ids, key: "client", include: true
  has_one :employee, embed: :ids, key: "employee", include: true

end
