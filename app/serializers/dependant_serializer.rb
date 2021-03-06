class DependantSerializer < ActiveModel::Serializer
  attributes(*Dependant.attribute_names.map(&:to_sym), :client)

  has_many :registrations, embed: :ids, key: "registrations"#, include: true

  def client
    self.client_id
  end
end
