class CourseSerializer < ActiveModel::Serializer
  attributes(*Course.attribute_names.map(&:to_sym), :category)

  has_many :events, embed: :ids, key: "events"#, include: true
  has_many :registraions, embed: :ids, key: "registrations"#, include: true

  def category
    self.category_id
  end

end
