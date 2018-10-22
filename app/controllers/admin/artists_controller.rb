module Admin
  class ArtistsController < AdminController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]

    def index
      results = if params[:query]
                  Artist.all.order(:name).where(
                    'lower(name) LIKE ? or lower(signature) like ?',
                    "%#{params[:query].downcase}%",
                    "%#{params[:query].downcase}%"
                  )
                else
                  Artist.all.order(:name)
                end
      @artists = results.page(params[:page])
    end

    def new
      @artist = Artist.new
    end

    def create
      @artist = Artist.new(artist_params)
      if @artist.save
        redirect_to success_path, notice: 'Successfully created artist.'
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @poem.update(artist_params)
        redirect_to success_path, notice: 'Successfully updated artist.'
      else
        render :edit
      end
    end

    def destroy
      @artist.destroy
      redirect_to admin_artists_path, notice: 'Successfully deleted artist.'
    end

    private

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params[:artist].permit(:name, :signature)
    end

    def success_path
      admin_artist_path(@artist)
    end
  end
end
