class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  ONE_POEM = 1

  def paginate_poems(poem_results)
    if poem_results.count == ONE_POEM
      redirect_to poem_path(poem_results.first.reference)
    else
      @poems = Kaminari.paginate_array(poem_results).page(params[:page])
      render 'poems/index'
    end
  end

  private

  def poem_results(opt = {})
    Poem.search('*', where: opt).results
  end
end
