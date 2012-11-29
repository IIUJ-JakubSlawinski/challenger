class LeaguesController < ApplicationController
  def index
  	@leagues = League.all

  	if !params[:id].nil?
  		@league_to_join = League.find(params[:id])
  	end
  end

end
