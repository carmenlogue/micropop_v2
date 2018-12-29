class HitsController < ApplicationController
  def index
    tag_ids = Tag.search(params[:hit_tag], misspellings: false).results.pluck(:id)
    poems = poem_results(tag_ids: tag_ids)
    paginate_search_results(poems)
  end
end
