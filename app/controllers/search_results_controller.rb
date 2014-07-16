class SearchResultsController < ApplicationController

  def index
    @results = PgSearch.multisearch(params[:q]).collect(&:searchable)
    @location_results = Location.search(params[:q])
  end

end
