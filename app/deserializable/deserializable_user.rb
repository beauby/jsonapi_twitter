class DeserializableUser < JSONAPI::Deserializable::Resource
  id

  attribute :name
  attribute :email

  has_many :tweets do |rel, ids, types|
    field tweet_ids: ids
  end
  has_many :sent_messages do |rel, ids, types|
    field sent_message_ids: ids
  end
  has_many :received_messages do |rel, ids, types|
    field received_message_ids: ids
  end
  has_many :friendships do |rel, ids, types|
    field friendship_ids: ids
  end
  has_many :friends do |rel, ids, types|
    field friend_ids: ids
  end
end
