class Show < ApplicationRecord
  belongs_to :movie

  scope :in_the_future, -> { where('time >= ?', Date.current) }
end
