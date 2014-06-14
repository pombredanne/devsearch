class SearchController < ApplicationController
  def index
    @query = params[:query]
    if @query.present?
      Search.download(@query)
      @results = Search::Result.search(@query)
    end
  end
end
