class UserSerializer < ActiveModel::Serializer
  attributes(*User.attribute_names.map(&:to_sym))
  
  has_one :client
  has_one :employee

end
