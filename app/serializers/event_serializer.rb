class EventSerializer < ActiveModel::Serializer
  attributes(*Event.attribute_names.map(&:to_sym))
  
end
