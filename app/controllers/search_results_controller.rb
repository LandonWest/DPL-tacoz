class SearchResultsController < ApplicationController

  def index
    # @results = PgSearch.multisearch(params[:q]).collect(&:searchable)
    @results = MenuItem.search(params[:q])
    @location_results = Location.search(params[:q])
  end

end
