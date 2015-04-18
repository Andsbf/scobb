class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name,:last_name

  has_one :client
  has_one :employee

end
