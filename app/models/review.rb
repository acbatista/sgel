class Review < ActiveRecord::Base
  POINTS = (1..5).to_a

  belongs_to :user
  belongs_to :book, counter_cache: true

  validates_uniqueness_of :user_id, scope: :book_id
  validates_presence_of :points, :user_id, :book_id
  validates_inclusion_of :points, in: POINTS

  def self.stars
  	(average(:points) || 0).round
  end
end
