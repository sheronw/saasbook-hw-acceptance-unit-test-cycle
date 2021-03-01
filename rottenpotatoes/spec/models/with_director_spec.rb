require 'rails_helper'

describe Movie, :type => :model do
  describe 'find move with certain director' do
    it 'return the correct matches for movies by the same director' do
      sw = Movie.new(title: "Star Wars", rating: "PG", director: "George Lucas", release_date: 1977-05-25)
      thx = Movie.new(title: "THX-1138", rating: "R", director: "George Lucas", release_date: 1971-03-11)
      sw.save
      thx.save
      movies = Movie.with_director(sw.director)
      expect(movies).to contain_exactly(sw,thx)
    end
    it 'should not return matches of movies by different directors' do
      sw = Movie.new(title: "Star Wars", rating: "PG", director: "George Lucas", release_date: 1977-05-25)
      b = Movie.new(title: "Blade Runner", rating: "PG", director: "Ridley Scott", release_date: 1982-06-25)
      sw.save
      b.save
      movies = Movie.with_director(sw.director)
      expect(movies).not_to contain_exactly(b)
    end
    it 'should return nothing when there is no director' do
      a = Movie.new(title: "Alien", rating: "R", release_date: "1979-05-25")
      a.save
      movies = Movie.with_director(a.director)
      expect(movies).to eq([])
    end
  end
end