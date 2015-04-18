class CourseSerializer < ActiveModel::Serializer
  attributes(*Course.attribute_names.map(&:to_sym))
end
