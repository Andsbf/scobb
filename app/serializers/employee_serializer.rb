class EmployeeSerializer < ActiveModel::Serializer
  attributes(*Employee.attribute_names.map(&:to_sym))
end
