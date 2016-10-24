class TweetsController < ApplicationController
  def payload
    DeserializableTweet.new(params.to_unsafe_h).to_h
  end

  def index
    tweets = Tweet.all
    render jsonapi: tweets
  end

  def show
    tweet = Tweet.find(params[:id])
    render jsonapi: tweet
  end

  def create
    tweet = Tweet.new(payload)

    if tweet.save
      render jsonapi: tweet
    else
      render jsonapi: tweet, errors: true
    end
  end

  def update
    tweet = Tweet.find(params[:id])

    if tweet.update_attributes(payload)
      render jsonapi: tweet
    else
      render jsonapi: tweet, errors: true
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    render jsonapi: tweet
  end
end
