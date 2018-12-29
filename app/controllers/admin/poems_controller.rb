module Admin
  class PoemsController < AdminController
    before_action :set_poem, only: [:show, :edit, :update, :destroy]

    def index
      query = params[:query].presence || '*'
      results = Poem.search(
        query,
        fields: ['fragment'],
        match: :word_start,
        misspellings: { below: 3 }
      ).results

      @poems = paginate_array(results)
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
      @poem = Poem.find_by(reference: params[:id])
    end

    def poem_params
      params[:poem].permit(:fragment, :image, :image_cache, :remove_image, :song_id, tag_ids: [])
    end

    def success_path
      admin_poem_path(@poem)
    end
  end
end
