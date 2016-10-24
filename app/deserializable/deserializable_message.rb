class DeserializableMessage < JSONAPI::Deserializable::Resource
  id

  attribute :content

  has_one :sender do |rel, id, type|
    field sender_id: id
  end
  has_one :receiver do |rel, id, type|
    field receiver_id: id
  end
end
