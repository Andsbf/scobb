class EventSerializer < ActiveModel::Serializer
  attributes(*Event.attribute_names.map(&:to_sym), :employee, :course)

  def employee
    self.employee_id
  end

  def course
    self.course_id
  end
  
end
