class PoemsController < ApplicationController
  def index
    @poems = Poem.all
  end

  def show
    @poem = Poem.find_by(reference: params[:reference])
  end
end
