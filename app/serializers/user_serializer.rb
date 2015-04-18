class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_one :client
  has_one :employee

end
