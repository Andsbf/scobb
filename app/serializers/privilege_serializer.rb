class PrivilegeSerializer < ActiveModel::Serializer
  attributes(*Privilege.attribute_names.map(&:to_sym), :employee)
  
  def employee
    self.employee_id
  end
end
