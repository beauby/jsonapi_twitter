class SerializableUser < JSONAPI::Serializable::Model
  type 'users'

  link(:self) { @url_helpers.user_url(@model.id) }

  attribute :name

  attribute :email

  has_many :tweets do
    link(:related) { @url_helpers.tweets_url(filter: { author_id: @model.id }) }
  end

  has_many :friends do
    link(:related) { @url_helpers.users_url(filter: { friend_id: @model.id }) }
  end

  has_many :sent_messages do
    link(:related) { @url_helpers.messages_url(filter: { sender_id: @model.id }) }
  end

  has_many :received_messages do
    link(:related) { @url_helpers.messages_url(filter: { receiver_id: @model.id }) }
  end
end
