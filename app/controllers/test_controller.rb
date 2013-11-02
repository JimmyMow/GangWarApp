class TestController < ApplicationController
  def map
    @crimes = Crime.all
    @find = Crime.where(:description => params[:description]).limit(params[:number])

  end

  def specific_crime
    @crime = Crime.find_by_id(params[:id])
  end

  def all
        @crimes = Crime.all
  end

  def search_results

  end
end
