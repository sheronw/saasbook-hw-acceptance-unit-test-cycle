class Movie < ActiveRecord::Base
  def self.with_director(director)
    (director == nil || director == "") ? [] : where(director: director)
  end
end
