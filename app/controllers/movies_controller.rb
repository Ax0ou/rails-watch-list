require 'open-uri'
require 'json'

class MoviesController < ApplicationController
  def index
    url = "https://tmdb.lewagon.com/movie/top_rated"
    movie_serialized = URI.open(url).read
    response = JSON.parse(movie_serialized)
    @movies = response["results"]
  end

  def show
    movie_id = params[:id]
    url = "https://tmdb.lewagon.com/movie/#{movie_id}"
    movie_serialized = URI.open(url).read
    @movie = JSON.parse(movie_serialized)
  end
end

