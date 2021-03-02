require 'rails_helper'

describe MoviesController do
  setup do
    sw = Movie.new(title: "Star Wars", rating: "PG", director: "George Lucas", release_date: 1977-05-25)
    thx = Movie.new(title: "THX-1138", rating: "R", director: "George Lucas", release_date: 1971-03-11)
    sw.save
    thx.save
    b = Movie.new(title: "Blade Runner", rating: "PG", director: "Ridley Scott", release_date: 1982-06-25)
    b.save
    @movie = Movie.find 1
  end
  
  describe 'find movie with same director' do
    it 'get id then search same director to serve' do

      
    end
    it 'redirect to home page if no director' do
      allow(Movie).to receive(:with_director).and_return( [] )
      get same_director_movie_path(@movie)
      assert_redirected_to movies_path
    end
  end
end