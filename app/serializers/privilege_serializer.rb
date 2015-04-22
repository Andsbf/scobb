class PrivilegeSerializer < ActiveModel::Serializer
  attributes(*Privilege.attribute_names.map(&:to_sym))
  
end
