module Admin
  class PoemsController < AdminController
    def index
      @poems = Poem.all.order(:fragment)
    end
  end
end
