class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.belongs_to :parent, index: true
      t.belongs_to :author, index: true
      t.text :content
      t.timestamps
    end
  end
end
