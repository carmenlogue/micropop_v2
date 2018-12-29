class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  ONE_POEM = 1

  def paginate_search_results(results)
    if results.count == ONE_POEM
      redirect_to poem_path(results.first.reference)
    else
      @poems = paginate_array(results)
      render 'poems/index'
    end
  end

  def paginate_array(results)
    Kaminari.paginate_array(results).page(params[:page])
  end

  private

  def poem_results(opt = {})
    Poem.search('*', where: opt).results
  end
end
