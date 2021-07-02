class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validate :star_rating_should_less_than_5
  validate :single_review_per_movie

  private

  def star_rating_should_less_than_5
    if star_rating.blank? || star_rating > 5 || star_rating < 0
      errors.add(:star_rating, "Should be present and it should be between zero and five")
    end
  end

  def single_review_per_movie
    user = User.find_by_id(user_id) if user_id.present?
    if user.present? && user.ratings.where(movie_id: movie_id).present?
      errors.add(:base, "You already have a review on this movie")
    end
  end
end
