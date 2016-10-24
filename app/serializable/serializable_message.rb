class SerializableMessage < JSONAPI::Serializable::Model
  type 'messages'

  link(:self) { @url_helpers.message_url(@model.id) }

  attribute :content

  attribute(:date) { @model.created_at }

  has_one :sender do
    link(:related) { @url_helpers.user_url(@model.sender_id) }
  end

  has_one :receiver do
    link(:related) { @url_helpers.user_url(@model.receiver_id) }
  end
end
