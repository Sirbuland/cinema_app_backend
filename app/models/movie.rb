class Movie < ApplicationRecord
  has_many :shows
  has_many :ratings
end
