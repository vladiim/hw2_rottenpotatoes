class Movie < ActiveRecord::Base

  def self.sort_by(column)
    Movie.order column
  end
end
