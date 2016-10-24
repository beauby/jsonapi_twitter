class Tweet < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :parent, class_name: 'Tweet', optional: true

  validates :content, length: { maximum: 140 }

  def content
    read_attribute(:content) || parent.content
  end

  def retweet?
    parent_id.present?
  end

  def retweets
    self.class.where(parent_id: id)
  end
end
