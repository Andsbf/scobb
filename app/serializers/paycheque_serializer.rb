class PaychequeSerializer < ActiveModel::Serializer
  attributes(*Paycheque.attribute_names.map(&:to_sym), :employee)

  def employee
    self.employee_id
  end

end
