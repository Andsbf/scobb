class PaymentSerializer < ActiveModel::Serializer
  attributes(*Payment.attribute_names.map(&:to_sym))

  has_one :registration, embed: :ids, key: "registration", include: true
end
