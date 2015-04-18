class PaymentSerializer < ActiveModel::Serializer
  attributes(*Payment.attribute_names.map(&:to_sym))
end
