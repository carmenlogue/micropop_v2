module Admin
  class PoemsController < AdminController
    before_action :set_poem, only: [:show, :edit, :update, :destroy]

    def index
      results = if params[:query]
                  Poem.all.order(:fragment).where(
                    'lower(fragment) LIKE ?',
                    "%#{params[:query].downcase}%"
                  )
                else
                  Poem.all.order(:fragment)
                end
      @poems = results.page(params[:page])
    end

    def new
      @poem = Poem.new
    end

    def create
      @poem = Poem.new(poem_params)
      if @poem.save
        redirect_to success_path, notice: 'Successfully created poem.'
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @poem.update(poem_params)
        redirect_to success_path, notice: 'Successfully updated poem.'
      else
        render :edit
      end
    end

    def destroy
      @poem.destroy
      redirect_to admin_poems_path, notice: 'Successfully deleted poem.'
    end

    private

    def set_poem
      @poem = Poem.find(params[:id])
    end

    def poem_params
      params[:poem].permit(:fragment)
    end

    def success_path
      admin_poem_path(@poem)
    end
  end
end
