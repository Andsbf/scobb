class PaychequeSerializer < ActiveModel::Serializer
  attributes(*Paycheque.attribute_names.map(&:to_sym))
end
