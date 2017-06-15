require 'httparty'
require 'json'

class MainController < ApplicationController
	include HTTParty, MainHelper

  def index
  	flash.now[:info] = 'welcome!'
  end

  def search
  	@res = HTTParty.get('https://itunes.apple.com/search?term=' + verify_input(params[:artist]))
  	@results = JSON.parse(@res.body)['results']

  	if @results.length <= 0 
  		flash.now[:warning] = "Your search returned no results, please check the artist name and try again."
  	end
  	puts 'RESULTS:'
  	puts @results
  end

  def show
  	@res = HTTParty.get('https://itunes.apple.com/lookup?entity=song&id=' + params[:id])
  	@single_track = JSON.parse(@res.body)['results']
  end

end
