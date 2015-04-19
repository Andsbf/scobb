class CategorySerializer < ActiveModel::Serializer
  attributes(*Category.attribute_names.map(&:to_sym))
  
  has_many :courses, embed: :ids, key: "courses", include: true
end
