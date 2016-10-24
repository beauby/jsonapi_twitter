class SerializableTweet < JSONAPI::Serializable::Model
  type 'tweets'

  attribute :content

  attribute(:date) { @model.created_at }

  has_one :author do
    link(:related) { @url_helpers.users_url(filter: { id: @model.author_id }) }
  end

  has_one :parent do
    link(:related) { @url_helpers.tweet_url(@model.parent_id || @model.id) }
  end

  has_many :retweets do
    link(:related) do
      @url_helpers.tweets_url(filter: { parent_id: @model.id })
    end
  end
end
