class Movie < ActiveRecord::Base

  RATINGS = ['G','PG','PG-13','R']

  scope :sort_by, lambda{ |column| order column }
  scope :filter_ratings, lambda{ |ratings| where(rating: ratings )}
end
