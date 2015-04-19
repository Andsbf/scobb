class CourseSerializer < ActiveModel::Serializer
  attributes(*Course.attribute_names.map(&:to_sym))

  has_many :events, embed: :ids, key: "events", include: true
end
